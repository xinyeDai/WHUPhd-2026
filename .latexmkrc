# SPDX-License-Identifier: MIT
# XeLaTeX, BibTeX and repeat passes are coordinated by latexmk.
$pdf_mode = 5;
$out_dir = 'build';
$xelatex = 'xelatex -no-pdf -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$bibtex_use = 2;
