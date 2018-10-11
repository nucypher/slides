# NuCypher Slides

### Build Requirements
* Inkscape: <https://inkscape.org>
* XeLaTeX

### Generate slides for	a specific event

1. Copy `template.tex.base` to `template.tex` - **do not edit** `template.tex.base`
2. Edit the template.tex file accordingly for the specific event.

For example:
```
\newcommand{\presenter}{MacLane Wilkison, CEO \& Co-Founder}
\newcommand{\presenterfooter}{MacLane}
\newcommand{\titlefooter}{NuCypher}
\newcommand{\emailname}{maclane}
\newcommand{\event}{Eth SF}
\newcommand{\eventdate}{05 Oct 2018}
```
_NOTE: Some special characters may need to be escaped using '\\'._

3. Run `make`


