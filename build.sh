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

mkdir -p "$OUTPUT_DIR/css"

pandoc \
  --from markdown+smart+fenced_divs \
  --to html5 \
  --standalone \
  --wrap none \
  --template "$ROOT_DIR/templates/web.html" \
  "$RESUME_FILE" \
  --output "$OUTPUT_DIR/index.html"

pandoc \
  --from markdown+smart+fenced_divs \
  --to html5 \
  --standalone \
  --css "$ROOT_DIR/css/print.css" \
  --pdf-engine weasyprint \
  --pdf-engine-opt=--pdf-tags \
  "$RESUME_FILE" \
  --output "$OUTPUT_DIR/$PDF_NAME"

install -m 0644 "$ROOT_DIR/css/web.css" "$OUTPUT_DIR/css/web.css"
install -m 0644 "$ROOT_DIR/css/print.css" "$OUTPUT_DIR/css/print.css"
install -m 0644 "$ROOT_DIR/assets/portrait.webp" "$OUTPUT_DIR/portrait.webp"
install -m 0644 "$ROOT_DIR/assets/favicon.svg" "$OUTPUT_DIR/favicon.svg"
install -m 0644 "$ROOT_DIR/static/404.html" "$OUTPUT_DIR/404.html"
install -m 0644 "$ROOT_DIR/static/robots.txt" "$OUTPUT_DIR/robots.txt"
install -m 0644 "$ROOT_DIR/static/sitemap.xml" "$OUTPUT_DIR/sitemap.xml"
install -m 0644 "$ROOT_DIR/static/_redirects" "$OUTPUT_DIR/_redirects"
install -m 0644 "$ROOT_DIR/static/_headers" "$OUTPUT_DIR/_headers"
install -m 0644 "$ROOT_DIR/static/.assetsignore" "$OUTPUT_DIR/.assetsignore"

printf 'Built %s and %s\n' "$OUTPUT_DIR/index.html" "$OUTPUT_DIR/$PDF_NAME"
