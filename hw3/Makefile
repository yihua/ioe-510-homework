SRCS =  hw3.tex p1/p1.tex p2/p2.tex

all: hw3.pdf 

pdf: hw3.pdf

ps: hw3.ps

hw3.blg: $(SRCS)
	latex hw3
	latex hw3

hw3.dvi: $(SRCS) hw3.blg
	latex hw3

hw3.ps: hw3.dvi
	dvips -Ppdf -t letter -D 600 -G1 hw3.dvi

hw3.pdf: hw3.ps
	ps2pdf14 hw3.ps hw3.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out
