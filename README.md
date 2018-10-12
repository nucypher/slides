# NuCypher Slides

## Build Requirements
* Inkscape: <https://inkscape.org>
* XeLaTeX

## Generating Slides for a Specific Event

### Branching
In order for the event-specific branches to be easily differentiated from the base branches eg. master, enterprise, please follow the following format `_<date>_<event>` i.e.
1. Start with an underscore
2. Date: yyyy_mm_dd
3. Event name

_*each separated with and underscore_

For Example: `_2018_10_05_ETHBerlin`

### Building

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


