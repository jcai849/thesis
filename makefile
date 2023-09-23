DOCS != find doc -name '*.tex'
.PHONY: thesis clean
.SUFFIXES: .pdf .tex
.ORDER: extern thesis.pdf
.tex.pdf:
	latexmk -file-line-error -shell-escape ${.IMPSRC}

thesis: extern thesis.pdf
thesis.pdf: $(DOCS)

extern: equations images tables
images:
	cd img && $(MAKE) images
equations:
	cd eq && $(MAKE) equations
tables:
	cd tab && $(MAKE) tables
clean:
	latexmk -C
	rm -f *.bbl
	rm -f *.lol
	rm -f *.tdo
	rm -f *.pyg
	rm -f *.run.xml
	rm -rf _minted*
	cd img && $(MAKE) clean
	cd eq && $(MAKE) clean
	cd tab && $(MAKE) clean
