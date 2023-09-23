DOCS != find doc -name '*.tex'
.PHONY: thesis clean full-clean
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
	rm -f *.run.xml
full-clean: clean
	rm -rf _minted*
	rm -f *.pyg
	rm -f tikz-cache
	cd img && $(MAKE) clean
	cd eq && $(MAKE) clean
	cd tab && $(MAKE) clean
