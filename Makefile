latexfile = mmbtools
includes = introduction.tex \
		   interfaces.tex \
		   scenarios.tex \
		   appendix.tex \
		   systemenvironments.tex \
		   production.tex \
		   datafeatures.tex \
		   sfn.tex \
		   supervision.tex

bib = dab.bib

all: $(latexfile).pdf

$(latexfile).pdf : $(bib) $(latexfile).tex vc.tex $(includes)
	while ( \
		pdflatex -halt-on-error $(latexfile) ; \
		bibtex $(latexfile) ; \
		grep -q "Rerun to get cross" $(latexfile).log \
	) do true ; \
	done

	bibtex $(latexfile)

vc.tex: .git/logs/HEAD
	echo "%%% This file is generated by Makefile." > vc.tex
	echo "%%% Do not edit this file!" >> vc.tex
	echo "" >> vc.tex
	git log -1 --format="format:\
		\\gdef\\GITAbrHash{%h}\
		\\gdef\\GITAuthorDate{%ad}\
		\\gdef\\GITAuthorName{%an}" >> vc.tex

clean:
	rm -f *.aux $(latexfile).{pdf,out,toc,log,bbl,blg} vc.tex
