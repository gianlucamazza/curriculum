# Gianluca Mazza - Professional CV

This repository contains my CV in LaTeX format with automatic building via GitHub Actions.

## Features

- Professional CV layout using LaTeX
- Automatic PDF generation on push to main branch
- PDF artifacts attached to GitHub releases
- Clean, modern design with FontAwesome icons

## Automatic Building

This CV is automatically built into a PDF using GitHub Actions:

- On every push to the main branch (when .tex files change)
- On pull request creation
- On new releases
- Manually through workflow dispatch

## Manual Building

If you want to build the CV locally:

1. Ensure you have a LaTeX distribution installed:
   - For macOS: [MacTeX](https://www.tug.org/mactex/)
   - For Windows: [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/)
   - For Linux: TeX Live (`sudo apt-get install texlive-full` on Debian/Ubuntu)

2. Make sure you have the required packages:
   - fontawesome5
   - enumitem
   - titlesec
   - latexsym
   - marvosym
   - babel
   - tabularx
   - multicol

3. Build using:

   ```bash
   pdflatex cv.tex
   ```

## Structure

- `cv.tex`: Main LaTeX file with CV content
- `glyphtounicode.tex`: Helper file for PDF text handling
- `.github/workflows/build-cv.yml`: GitHub Actions workflow configuration

## License

Copyright © 2024 Gianluca Mazza. All rights reserved.

## Contact

- Email: <info@gianlucamazza.it>
- Website: <https://gianlucamazza.it>
- LinkedIn: <https://linkedin.com/in/gianlucamazza>
- GitHub: <https://github.com/gianlucamazza>
