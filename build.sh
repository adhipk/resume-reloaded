#!/bin/bash
set -e

HTML='--standalone --embed-resources --css screen.css'
PDF='--standalone --embed-resources --css style.css'
ENG='--pdf-engine=weasyprint'
mkdir -p "${OUTPUT_DIR:-out}

pandoc $HTML $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-out}/index.html"
pandoc $PDF $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-out}/$1.pdf"
