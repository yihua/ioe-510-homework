SRCS =  hw8.tex p1/p1.tex p2/p2.tex p4/p4.tex p5/p5.tex p6/p6.tex

all: hw8.pdf 

pdf: hw8.pdf

ps: hw8.ps

hw8.blg: $(SRCS)
	latex hw8
	latex hw8

hw8.dvi: $(SRCS) hw8.blg
	latex hw8

hw8.ps: hw8.dvi
	dvips hw8.dvi

#	dvips -Ppdf -t letter -D 1200 -G1 hw8.dvi
        

hw8.pdf: hw8.ps
	ps2pdf14 hw8.ps hw8.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
