DOCS != find doc -name '*.tex'
.PHONY: thesis clean
.SUFFIXES: .pdf .tex
.ORDER: images thesis.pdf
.tex.pdf:
	latexmk -shell-escape ${.IMPSRC}

thesis: images thesis.pdf
thesis.pdf: $(DOCS)

images:
	cd img && $(MAKE) images
clean:
	latexmk -C
	rm -f *.bbl
	rm -f *.lol
	rm -f *.tdo
	rm -f *.run.xml
	rm -rf _minted*
	cd img && $(MAKE) clean
