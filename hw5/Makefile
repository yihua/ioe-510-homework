SRCS =  hw5.tex p1/p1.tex p2/p2.tex p4/p4.tex p5/p5.tex p6/p6.tex 

all: hw5.pdf 

pdf: hw5.pdf

ps: hw5.ps

hw5.blg: $(SRCS)
	latex hw5
	latex hw5

hw5.dvi: $(SRCS) hw5.blg
	latex hw5

hw5.ps: hw5.dvi
	dvips hw5.dvi

#	dvips -Ppdf -t letter -D 1200 -G1 hw5.dvi
        

hw5.pdf: hw5.ps
	ps2pdf14 hw5.ps hw5.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
