OUTPUT_DIRECTORY=out

HTML='--standalone --embed-resources  --css screen.css'
PDF='--standalone --embed-resources  --css style.css'
ENG='--pdf-engine=weasyprint'

mkdir -p $OUTPUT_DIRECTORY
pandoc $PDF  $ENG  -t html -f markdown+smart $1.md -o $OUTPUT_DIRECTORY/$1.pdf
pandoc $HTML  $ENG  -t html -f markdown+smart $1.md  -o $OUTPUT_DIRECTORY/$1.html