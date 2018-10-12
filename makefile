SVG = $(wildcard svg/*.svg)
PDF = $(SVG:svg/%.svg=pdf/%.pdf)

all: $(PDF) slides.pdf

slides.pdf:	template.tex slides.tex
		xelatex slides.tex && xelatex slides.tex && rm -f *.aux *.log *.nav *.toc *.out *.snm *.vrb

$(PDF):	pdf/%.pdf: svg/%.svg
		inkscape "$<" --export-pdf="$@"


