#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESUME_FILE="${RESUME_FILE:-$ROOT_DIR/resumes/resume.md}"
OUTPUT_DIR="${OUTPUT_DIR:-$ROOT_DIR/out}"
PDF_NAME="Adhip_Kashyap_resume.pdf"

for command in pandoc weasyprint; do
  if ! command -v "$command" >/dev/null 2>&1; then
    printf 'Missing required command: %s\n' "$command" >&2
    exit 1
  fi
done

OUTPUT_PARENT="$(dirname "$OUTPUT_DIR")"
OUTPUT_NAME="$(basename "$OUTPUT_DIR")"
mkdir -p "$OUTPUT_PARENT"
OUTPUT_PARENT="$(cd "$OUTPUT_PARENT" && pwd -P)"
OUTPUT_DIR="$OUTPUT_PARENT/$OUTPUT_NAME"

if [[ -e "$OUTPUT_DIR" || -L "$OUTPUT_DIR" ]]; then
  [[ -d "$OUTPUT_DIR" && ! -L "$OUTPUT_DIR" ]] || {
    printf 'Output path exists but is not a real directory: %s\n' "$OUTPUT_DIR" >&2
    exit 1
  }
fi

STAGING_DIR="$(mktemp -d "$OUTPUT_PARENT/.${OUTPUT_NAME}.stage.XXXXXX")"
BACKUP_DIR=""

cleanup() {
  local status=$?
  trap - EXIT

  [[ ! -d "$STAGING_DIR" ]] || rm -rf "$STAGING_DIR"
  if [[ -n "$BACKUP_DIR" && -d "$BACKUP_DIR" ]]; then
    if [[ ! -e "$OUTPUT_DIR" && ! -L "$OUTPUT_DIR" ]]; then
      mv "$BACKUP_DIR" "$OUTPUT_DIR"
    else
      rm -rf "$BACKUP_DIR"
    fi
  fi

  exit "$status"
}
trap cleanup EXIT

mkdir -p "$STAGING_DIR/css" "$STAGING_DIR/assets"

pandoc \
  --from markdown+smart+fenced_divs \
  --to html5 \
  --standalone \
  --wrap none \
  --template "$ROOT_DIR/templates/web.html" \
  "$RESUME_FILE" \
  --output "$STAGING_DIR/index.html"

pandoc \
  --from markdown+smart+fenced_divs \
  --to html5 \
  --standalone \
  --css "$ROOT_DIR/css/print.css" \
  --pdf-engine weasyprint \
  --pdf-engine-opt=--pdf-tags \
  "$RESUME_FILE" \
  --output "$STAGING_DIR/$PDF_NAME"

install -m 0644 "$ROOT_DIR/css/web.css" "$STAGING_DIR/css/web.css"
install -m 0644 "$ROOT_DIR/css/print.css" "$STAGING_DIR/css/print.css"
install -m 0644 "$ROOT_DIR/assets/portrait.webp" "$STAGING_DIR/assets/profile_pic.webp"
install -m 0644 "$ROOT_DIR/assets/favicon.svg" "$STAGING_DIR/favicon.svg"
install -m 0644 "$ROOT_DIR/static/tabs.js" "$STAGING_DIR/tabs.js"
install -m 0644 "$ROOT_DIR/static/404.html" "$STAGING_DIR/404.html"
install -m 0644 "$ROOT_DIR/static/robots.txt" "$STAGING_DIR/robots.txt"
install -m 0644 "$ROOT_DIR/static/sitemap.xml" "$STAGING_DIR/sitemap.xml"
install -m 0644 "$ROOT_DIR/static/_redirects" "$STAGING_DIR/_redirects"
install -m 0644 "$ROOT_DIR/static/_headers" "$STAGING_DIR/_headers"
install -m 0644 "$ROOT_DIR/static/.assetsignore" "$STAGING_DIR/.assetsignore"

if [[ -d "$OUTPUT_DIR" ]]; then
  BACKUP_DIR="$(mktemp -d "$OUTPUT_PARENT/.${OUTPUT_NAME}.previous.XXXXXX")"
  rmdir "$BACKUP_DIR"
  mv "$OUTPUT_DIR" "$BACKUP_DIR"
fi
mv "$STAGING_DIR" "$OUTPUT_DIR"
STAGING_DIR=""

if [[ -n "$BACKUP_DIR" ]]; then
  rm -rf "$BACKUP_DIR"
  BACKUP_DIR=""
fi
trap - EXIT

printf 'Built %s and %s\n' "$OUTPUT_DIR/index.html" "$OUTPUT_DIR/$PDF_NAME"
