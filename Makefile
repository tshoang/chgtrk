default: chgtrk.pdf sample-chgtrk.pdf

chgtrk.pdf: chgtrk.sty
	pdflatex chgtrk.dtx
	makeindex -s gglo.ist -o chgtrk.gls chgtrk.glo
	makeindex -s gind.ist -o chgtrk.ind chgtrk.idx
	pdflatex chgtrk.dtx

chgtrk.sty: chgtrk.ins chgtrk.dtx
	pdflatex chgtrk.ins

sample-chgtrk.pdf: sample-chgtrk.tex sample-main.tex chgtrk.sty
	pdflatex sample-chgtrk.tex
	pdflatex sample-chgtrk.tex

clean:
	rm -f *.aux chgtrk.glo chgtrk.gls chgtrk.idx chgtrk.ilg chgtrk.ind sample-chgtrk.ilg *.log sample-chgtrk.nlo sample-chgtrk.nls chgtrk.toc

cleanall: clean
	rm -f chgtrk.pdf chgtrk.sty sample-chgtrk.pdf

