SRCS =  hw2.tex p1/p1.tex p2/p2.tex p3/p3.tex p4/p4.tex p5/p5.tex

all: hw2.pdf 

pdf: hw2.pdf

ps: hw2.ps

hw2.blg: $(SRCS)
	latex hw2
	latex hw2

hw2.dvi: $(SRCS) hw2.blg
	latex hw2

hw2.ps: hw2.dvi
	dvips -Ppdf -t letter -D 600 -G1 hw2.dvi

hw2.pdf: hw2.ps
	ps2pdf14 hw2.ps hw2.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
