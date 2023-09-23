.PHONY: equations clean
.SUFFIXES: .texmath .tex
.texmath.tex:
	cp ${.IMPSRC} ${.TARGET}

TEXMATH != echo *.texmath

equations: $(TEXMATH:S/texmath$/tex$/)
clean:
	rm -f *.tex
