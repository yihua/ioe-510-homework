SRCS =  hw4.tex p1/p1.tex p2/p2.tex

all: hw4.pdf 

pdf: hw4.pdf

ps: hw4.ps

hw4.blg: $(SRCS)
	latex hw4
	latex hw4

hw4.dvi: $(SRCS) hw4.blg
	latex hw4

hw4.ps: hw4.dvi
	dvips -Ppdf -t letter -D 600 -G1 hw4.dvi

hw4.pdf: hw4.ps
	ps2pdf14 hw4.ps hw4.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
