#!/bin/bash

# Check if act is installed
if ! command -v act &> /dev/null; then
    echo "Error: 'act' is not installed. Please install it first."
    echo "Installation guide: https://github.com/nektos/act#installation"
    exit 1
fi

# Run the GitHub Actions workflow locally
echo "Running GitHub Actions workflow locally with act..."
act -j build_latex --env ACT=true

# Check if the PDF was generated
if [ -f "artifacts/cv.pdf" ]; then
    echo "Success! CV PDF was generated at artifacts/cv.pdf"
    # Open the PDF with the default application
    open artifacts/cv.pdf 2>/dev/null || xdg-open artifacts/cv.pdf 2>/dev/null || echo "PDF generated at artifacts/cv.pdf"
else
    echo "Error: CV PDF was not generated. Check the output for errors."
    exit 1
fi 