.PHONY: tables clean
.SUFFIXES: .textab .tex
.textab.tex:
	cp ${.IMPSRC} ${.TARGET}

TEXTAB != echo *.textab

tables: $(TEXTAB:S/textab$/tex$/)
clean:
	rm -f *.tex
