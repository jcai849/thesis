.PHONY: images clean
.SUFFIXES: .puml .tex .gv .tikz
.puml.tex:
	plantuml -p -tlatex:nopreamble >${.TARGET} <${.IMPSRC} 
.gv.tex:
	dot2tex -ftikz --figonly --autosize --usepdflatex ${.IMPSRC} >${.TARGET}
.tikz.tex:
	cp ${.IMPSRC} ${.TARGET}
.tab.tex:
	cp ${.IMPSRC} ${.TARGET}

GV != echo *.gv
PUML != echo *.puml
TIKZ != echo *.tikz
TAB != echo *.tab

images: $(GV:S/gv$/tex$/) $(PUML:S/puml$/tex$/) $(TIKZ:S/tikz$/tex$/) $(TAB:S/tab$/tex$/)
clean:
	rm -f *.tex
