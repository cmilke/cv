SHELL    = /bin/bash
LATEX = lualatex
BIBTEX   = bibtex
DVIPS    = dvips

default: cv

cv: cv.tex
	latexmk -$(LATEX) -logfilewarnings -halt-on-error cv

final:
	if [ -f *.aux ]; then \
		$(MAKE) clean; \
	fi
	$(MAKE) cv
	$(MAKE) clean


clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
		  *.fls *.fdb_latexmk \
	      *.inx *.dvi *.toc *.ptc *.out *~ ~* spellTmp

realclean: clean
	rm -f *.ps *.pdf
