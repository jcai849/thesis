.PHONY: images clean
.SUFFIXES: .puml .tex .gv .tikz
.puml.tex:
	plantuml -p -tlatex:nopreamble >${.TARGET} <${.IMPSRC} 
.gv.tex:
	dot2tex -ftikz --figonly --autosize --usepdflatex ${.IMPSRC} >${.TARGET}
.tikz.tex:
	cp ${.IMPSRC} >${.TARGET}

GV != echo *.gv
PUML != echo *.puml
TIKZ != echo *.tikz

images: $(GV:gv=tex) $(PUML:puml=tex) #$(TIKZ:tikz=tex)
clean:
	rm -f *.tex
