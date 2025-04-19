#!/bin/bash

echo "Building CV using Docker..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

# Create output directory
mkdir -p output

# Build the CV using a LaTeX Docker image
# Using thomasweise/texlive which has good ARM64 support
docker run --rm \
  -v "$(pwd):/data" \
  -w /data \
  thomasweise/texlive \
  /bin/sh -c "pdflatex -interaction=nonstopmode cv.tex && pdflatex -interaction=nonstopmode cv.tex"

# Check if the PDF was generated
if [ -f "cv.pdf" ]; then
    echo "Success! CV PDF was generated at cv.pdf"
    # Move to output directory
    mv cv.pdf output/
    # Open the PDF with the default application
    open output/cv.pdf 2>/dev/null || xdg-open output/cv.pdf 2>/dev/null || echo "PDF generated at output/cv.pdf"
else
    echo "Error: CV PDF was not generated. Check the output for errors."
    exit 1
fi

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -f *.aux *.log *.out 