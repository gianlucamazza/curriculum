#!/bin/bash

echo "Building CV using Docker with ARM64 compatibility..."

# Create output directory
mkdir -p output

# Build the CV using a full TeX Live Docker image
docker run --rm \
  --platform=linux/amd64 \
  -v "$(pwd):/workdir" \
  -w /workdir \
  thomasweise/docker-texlive-full \
  sh -c "pdflatex -interaction=nonstopmode cv.tex && \
         pdflatex -interaction=nonstopmode cv.tex && \
         ls -la && \
         cp cv.pdf output/"

# Check if the PDF was generated
if [ -f "output/cv.pdf" ]; then
    echo "Success! CV PDF was generated at output/cv.pdf"
    open output/cv.pdf 2>/dev/null || xdg-open output/cv.pdf 2>/dev/null
else
    echo "Error: CV PDF was not generated. Check the output for errors."
    exit 1
fi

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -f *.aux *.log *.out *.toc 