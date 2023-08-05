.PHONY: thesis clean
.SUFFIXES: .pdf .tex
.tex.pdf:
	latexmk -shell-escape ${.IMPSRC}

thesis: thesis.pdf
thesis.tex: images
images:
	cd img && $(MAKE) images
clean:
	latexmk -C
	rm -f *.bbl
	rm -f *.lol
	rm -f *.tdo
	rm -f *.run.xml
	cd img && $(MAKE) clean
