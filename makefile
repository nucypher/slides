SVG = $(wildcard svg/*.svg)
PDF = $(SVG:svg/%.svg=pdf/%.pdf)

all: $(PDF) slides.pdf

slides.pdf:	check-vars slides.tex
		xelatex $(LATEX_OPTIONS) && xelatex $(LATEX_OPTIONS) && rm -f *.aux *.log *.nav *.toc *.out *.snm *.vrb

$(PDF):	pdf/%.pdf: svg/%.svg
		inkscape "$<" --export-pdf="$@"

define usage
	$(info '*** Error: $(1) ***')
        $(info )
        $(info Usage: make [TITLE_FOOT=<presentation_title_footer>] PRES=<presenter_names_roles> PRES_FOOT=<presenter_footer> EMAIL=<email_name> EVENT_DATE=<dd MMM yyyy> EVENT=<event>)
        $(info where)
        $(info     TITLE_FOOT - the footer title of the presentation (optional - default is 'NuCypher'))
        $(info     PRES       - the name(s) of the presenter(s) and optional role for the title slide)
        $(info     PRES_FOOT  - the text for the presenter footer eg. first name)
        $(info     EMAIL      - the email name prefix for the presenter i.e. <email>@nucypher.com)
        $(info     EVENT      - the name of the event)
        $(info     EVENT_DATE - the date of the event with format: dd MMM yyyy)
        $(info )
        $(info *To simply run a templated build for non-event specific updates:*)
	$(info Usage: make BUILD=template )
	$(info )
        $(error )
endef

check-vars:
TITLE_FOOT ?= "NuCypher"
ifeq ($(BUILD),template)
  PRES="\<presenter name\(s\), role\(s\)\>"
  PRES_FOOT="\<presenter fname\(s\)\>"
  EMAIL="\<email\>"
  EVENT_DATE="\<dd MMM yyyy\>"
  EVENT="\<event name\>"
else
  ifndef PRES
    $(call usage,presenter name(s) not defined)
  endif
  ifndef PRES_FOOT
    $(call usage,presenter footnote not defined)
  endif
  ifndef EMAIL
    $(call usage,email name prefix not defined)
  endif
  ifndef EVENT
    $(call usage,event not defined)
  endif
  ifndef EVENT_DATE
    $(call usage,event date not defined)
  endif
endif
LATEX_OPTIONS="\def\titlefooter{$(TITLE_FOOT)} \def\presenter{$(PRES)} \def\presenterfooter{$(PRES_FOOT)} \def\emailname{$(EMAIL)} \def\event{$(EVENT)} \def\eventdate{$(EVENT_DATE)} \input{slides.tex}"



