# matan-latex-template
Matan's ongoing latex template. 

* BIber: must be installed 
* If the compilation is failing: run `make clean; latexmk -C` and `biber --cache` which will output a path (`rm -rf` that path). Then `make` then try compiling again. 
* Abstract: un-comment abstract in paper.tex and write in `sections/abstract.tex`
* Bib: uncomment out `\printbibliography` in `paper.tex`
* table of contents: uncomment `uncomment below for TOC` in paper.tex 