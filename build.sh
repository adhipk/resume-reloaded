#!/bin/bash
set -e

# Define paths relative to src directory
HTML='--standalone --embed-resources --css css/web.css'
PDF='--standalone --embed-resources --css css/print.css'
ENG='--pdf-engine=weasyprint'
RESUME_DIR="${RESUME_DIR:-resumes}"
OUTPUT_DIR="${OUTPUT_DIR:-out}"
PREFIX="Adhip_Kashyap"
mkdir -p "$OUTPUT_DIR"

# Function to extract target from frontmatter
get_target() {
    local file="$1"
    # Extract the entire frontmatter section between --- markers
    local frontmatter=$(sed -n '/^---$/,/^---$/p' "$file" | grep -v '^---$')
    
    # Look for target in the frontmatter
    local target=$(echo "$frontmatter" | grep -i "^target:" | sed 's/^target:[[:space:]]*//i')
    
    # If no target found, use filename without extension
    if [ -z "$target" ]; then
        target=$(basename "$file" .md)
    fi
    echo "$target"
}

# Process all markdown files in the current directory
for md_file in ${RESUME_DIR}/*.md; do
    if [ -f "$md_file" ]; then
        base_name=$(basename "$md_file" .md)
        target=$(get_target "$md_file")
        pdf_name="${PREFIX}_$base_name"
        echo "pdf $PREFIX"
        # If target is the same as base_name, use base_name for both outputs
        if [ "$target" = "$base_name" ]; then
            echo "Processing $md_file -> Using base name: $base_name"
            pandoc $HTML $ENG -t html -f markdown+smart "$md_file" -o "$OUTPUT_DIR/$base_name.html"
            pandoc $PDF $ENG -t html -f markdown+smart "$md_file" -o "$OUTPUT_DIR/$pdf_name.pdf"
        elif [ "$target" = "none" ]; then
            echo "Skipping $md_file -> $target"
            pandoc $PDF $ENG -t html -f markdown+smart "$md_file" -o "$OUTPUT_DIR/$pdf_name.pdf"
        else
            echo "Processing $md_file -> HTML: $target, PDF: $base_name"
            pandoc $HTML $ENG -t html -f markdown+smart "$md_file" -o "$OUTPUT_DIR/$target.html"
            pandoc $PDF $ENG -t html -f markdown+smart "$md_file" -o "$OUTPUT_DIR/$pdf_name.pdf"
        fi
    fi
done 