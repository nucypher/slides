SVG = $(wildcard svg/*.svg)
PDF = $(SVG:svg/%.svg=pdf/%.pdf)

all: $(PDF) slides.pdf

slides.pdf:	check-env slides.tex
		xelatex $(LATEX_OPTIONS) && xelatex $(LATEX_OPTIONS) && rm -f *.aux *.log *.nav *.toc *.out *.snm *.vrb

$(PDF):	pdf/%.pdf: svg/%.svg
		inkscape "$<" --export-pdf="$@"

define usage
        $(info '*** Error: $(1) ***')
        $(info )
        $(info Usage: make [TITLE_FOOT=<presentation_title_footer>] PRES_FOOT=<presentation_footer> PRES=<presenter_name> ROLE=<role> PRES_FOOT=<presentation_footer> PDATE=<dd MMM yyyy> EVENT=<event> EMAIL=<email>)
        $(info where)
        $(info     TITLE_FOOT - the footer title of the presentation (optional - default is 'NuCypher'))
        $(info     PRES       - the name(s) of the presenter(s) for the title slide)
        $(info     PRES_FOOT  - the text for the presenter footer of the presentation)
        $(info     EMAIL      - the email name prefix i.e. <email>@nucypher.com)
        $(info     EVENT      - the name of the event)
        $(info     EVENT_DATE - the date of the event - dd MMM yyyy)
        $(into    )
        $(error   )
endef

check-env:
ifndef TITLE_FOOT
  TITLE_FOOT="NuCypher"
endif
ifndef PRES
  $(call usage,presenter name(s) not defined)
endif
ifndef PRES_FOOT
  $(call usage,presenter footnote not defined)
endif
ifndef EMAIL
  $(call usage,email name not defined)
endif
ifndef EVENT
  $(call usage,event name not defined)
endif
ifndef EVENT_DATE
  $(call usage,event date not defined)
endif
LATEX_OPTIONS="\def\titlefooter{$(TITLE_FOOT)} \def\presenter{$(PRES)} \def\presenterfooter{$(PRES_FOOT)} \def\emailname{$(EMAIL)} \def\event{$(EVENT)} \def\eventdate{$(EVENT_DATE)} \input{slides.tex}"
