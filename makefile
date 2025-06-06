DOCS != find doc -name '*.tex'
.PHONY: thesis clean full-clean indent corrections
.SUFFIXES: .pdf .tex .typ
.ORDER: extern thesis.pdf
.tex.pdf:
	latexmk -lualatex -file-line-error -shell-escape ${.IMPSRC}
.typ.pdf:
	typst compile ${.IMPSRC}

thesis: extern thesis.pdf 
thesis.pdf: $(DOCS) header.sty tikz-cache thesis.tex

corrections: corrections.pdf

thesis-expanded.pdf: thesis-expanded.tex
thesis-expanded.tex: $(DOCS) header.sty tikz-cache thesis.tex
	latexpand --empty-comments --keep-comments thesis.tex -o $@

extern: equations images tables
images:
	cd img && $(MAKE) images
equations:
	cd eq && $(MAKE) equations
tables:
	cd tab && $(MAKE) tables
tikz-cache:
	mkdir tikz-cache
clean:
	latexmk -C
	rm -f *.bbl
	rm -f *.lol
	rm -f *.tdo
	rm -f *.run.xml
	rm -f *.auxlock
	rm -f *.paux
	rm -f *.log
full-clean: clean
	rm -rf _minted*
	rm -f *.pyg
	rm -f tikz-cache
	cd img && $(MAKE) clean
	cd eq && $(MAKE) clean
	cd tab && $(MAKE) clean
indent:
	find doc -name '*.tex' -exec latexindent -l -c=latexindent/ -m -w {} \;
