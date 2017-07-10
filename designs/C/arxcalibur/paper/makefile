LATEXMK = latexmk -pdf
LATEX = pdflatex

all:
	${LATEXMK} iacrdoc.tex
	${LATEXMK} paper.tex

clean:
	@echo cleaning...
	@rm *.aux 2> /dev/null || true
	@rm *.log 2> /dev/null || true
	@rm *.out 2> /dev/null || true
	@rm *.toc 2> /dev/null || true
	@rm *.snm 2> /dev/null || true
	@rm *.nav 2> /dev/null || true
	@rm *.vrb 2> /dev/null || true
	@rm *.bbl 2> /dev/null || true
	@rm *.blg 2> /dev/null || true
	@rm *.idx 2> /dev/null || true
	@rm *.lol 2> /dev/null || true
	@rm *.fls 2> /dev/null || true
	@rm *.fdb_latexmk 2> /dev/null || true

open: all
	evince paper.pdf