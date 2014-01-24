SRCS =  hw1.tex p1.tex p2.tex p3.tex ex1.4to1.6.tex p7.tex

all: hw1.pdf 

pdf: hw1.pdf

ps: hw1.ps

hw1.blg: $(SRCS)
	latex hw1
	latex hw1

hw1.dvi: $(SRCS) hw1.blg
	latex hw1

hw1.ps: hw1.dvi
	dvips -Ppdf -t letter -D 600 -G1 hw1.dvi

hw1.pdf: hw1.ps
	ps2pdf14 hw1.ps hw1.pdf

clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl
