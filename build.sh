#!/bin/bash
set -e

HTML='--standalone --embed-resources --css screen.css'
PDF='--standalone --embed-resources --css style.css'
ENG='--pdf-engine=weasyprint'

if [ "$2" = "html" ]; then
    pandoc $HTML $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-output}/index.html"
elif [ "$2" = "pdf" ]; then
    pandoc $PDF $ENG -t html -f markdown+smart $1.md -o "${OUTPUT_DIR:-output}/$1.pdf"
else
    echo "Usage: $0 <input-file> <html|pdf>"
    exit 1
fi