#!/bin/bash
set -e

HTML='--standalone --embed-resources --css screen.css'
PDF='--standalone --embed-resources --css style.css'
ENG='--pdf-engine=weasyprint'
mkdir -p "${OUTPUT_DIR:-out}"
OUT="${2:-index}"
pandoc $HTML $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-out}/$OUT.html"
pandoc $PDF $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-out}/$1.pdf"
