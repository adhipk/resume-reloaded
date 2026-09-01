#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOLS_DIR="${VERCEL_TOOLS_DIR:-$ROOT_DIR/.vercel-tools}"
PANDOC_VERSION="3.8.3"
WEASYPRINT_VERSION="67.0"

case "$(uname -s):$(uname -m)" in
  Linux:x86_64)
    PANDOC_ASSET="linux-amd64.tar.gz"
    PANDOC_EXTRACTED_DIR="pandoc-$PANDOC_VERSION"
    ;;
  Linux:aarch64 | Linux:arm64)
    PANDOC_ASSET="linux-arm64.tar.gz"
    PANDOC_EXTRACTED_DIR="pandoc-$PANDOC_VERSION"
    ;;
  Darwin:x86_64)
    PANDOC_ASSET="x86_64-macOS.zip"
    PANDOC_EXTRACTED_DIR="pandoc-$PANDOC_VERSION-x86_64"
    ;;
  Darwin:arm64)
    PANDOC_ASSET="arm64-macOS.zip"
    PANDOC_EXTRACTED_DIR="pandoc-$PANDOC_VERSION-arm64"
    ;;
  *)
    printf 'Unsupported platform: %s %s\n' "$(uname -s)" "$(uname -m)" >&2
    exit 1
    ;;
esac

PANDOC_DIR="$TOOLS_DIR/pandoc"
PANDOC_BIN="$PANDOC_DIR/bin/pandoc"
VENV_DIR="$TOOLS_DIR/venv"

mkdir -p "$TOOLS_DIR"

if [[ ! -x "$PANDOC_BIN" ]]; then
  PANDOC_ARCHIVE="$TOOLS_DIR/pandoc-$PANDOC_VERSION-$PANDOC_ASSET"
  curl -fsSL \
    "https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-$PANDOC_ASSET" \
    -o "$PANDOC_ARCHIVE"
  case "$PANDOC_ARCHIVE" in
    *.tar.gz) tar -xzf "$PANDOC_ARCHIVE" -C "$TOOLS_DIR" ;;
    *.zip) unzip -q "$PANDOC_ARCHIVE" -d "$TOOLS_DIR" ;;
  esac
  rm -f "$PANDOC_ARCHIVE"
  mv "$TOOLS_DIR/$PANDOC_EXTRACTED_DIR" "$PANDOC_DIR"
fi

if [[ ! -x "$VENV_DIR/bin/weasyprint" ]]; then
  python3 -m venv "$VENV_DIR"
  "$VENV_DIR/bin/pip" install \
    --disable-pip-version-check \
    --no-cache-dir \
    "weasyprint==$WEASYPRINT_VERSION"
fi

"$PANDOC_BIN" --version | sed -n '1p'
"$VENV_DIR/bin/weasyprint" --version
