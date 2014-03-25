SRCS =  hw6.tex p1/p1.tex p2/p2.tex p4/p4.tex p5/p5.tex p6/p6.tex 

all: hw6.pdf 

pdf: hw6.pdf

ps: hw6.ps

hw6.blg: $(SRCS)
	latex hw6
	latex hw6

hw6.dvi: $(SRCS) hw6.blg
	latex hw6

hw6.ps: hw6.dvi
	dvips hw6.dvi

#	dvips -Ppdf -t letter -D 1200 -G1 hw6.dvi
        

hw6.pdf: hw6.ps
	ps2pdf14 hw6.ps hw6.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
