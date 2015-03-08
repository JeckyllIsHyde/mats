
pdf: main.tex 
	pdflatex --enable-write18 main.tex
	bibtex main
	pdflatex --enable-write18 main.tex
	pdflatex --enable-write18 main.tex

clear:
	rm -rf main.out main.log main.aux main.pdf main.toc main.bbl main.blg
