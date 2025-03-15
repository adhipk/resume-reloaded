set -a && source .env && set +a

HTML='--standalone --embed-resources  --css screen.css'
PDF='--standalone --embed-resources  --css style.css'
ENG='--pdf-engine=weasyprint'

# pandoc $PDF  $ENG  -t html -f markdown+smart $1.md -o $OUTPUT_DIR/$1.pdf
pandoc $HTML  $ENG  -t html -f markdown+smart $1.md  -o index.html

# pandoc $HTML  $ENG  -t html -f markdown+smart $1.md  -o out/web.html
# pandoc $PDF  $ENG  -t html -f markdown+smart $1.md  -o out/pdf.html