SRCS =  hw7.tex p1/p1.tex p2/p2.tex p4/p4.tex p5/p5.tex p6/p6.tex

all: hw7.pdf 

pdf: hw7.pdf

ps: hw7.ps

hw7.blg: $(SRCS)
	latex hw7
	latex hw7

hw7.dvi: $(SRCS) hw7.blg
	latex hw7

hw7.ps: hw7.dvi
	dvips hw7.dvi

#	dvips -Ppdf -t letter -D 1200 -G1 hw7.dvi
        

hw7.pdf: hw7.ps
	ps2pdf14 hw7.ps hw7.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
