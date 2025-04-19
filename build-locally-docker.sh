#!/bin/bash

echo "Building CV using Docker..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

# Create output directory
mkdir -p output

# Get the absolute path
CURRENT_DIR=$(pwd)

echo "Current directory: $CURRENT_DIR"
echo "Files in directory:"
ls -la

# Try with a different LaTeX image with ARM64 support
echo "Using ARM64-compatible Docker image..."
docker run --rm \
  --platform linux/arm64 \
  -v "$CURRENT_DIR:/workdir" \
  -w /workdir \
  ghcr.io/xu-cheng/texlive-full:latest \
  bash -c "ls -la && pdflatex -interaction=nonstopmode cv.tex && pdflatex -interaction=nonstopmode cv.tex"

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