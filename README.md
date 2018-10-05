# NuCypher Slides

### Build Requirements
* Inkscape: <https://inkscape.org>
* XeLaTeX

### Generate slides for	a specific event
```
Usage: make [TITLE_FOOT=<presentation_title_footer>] PRES_INFO=<presenter_information> PRES_FOOT=<presenter_footer> EMAIL=<email_prefix> EVENT_DATE=<dd MMM yyyy> EVENT=<event>
where
	TITLE_FOOT - the footer title of the presentation (optional - default is 'NuCypher')
	PRES_INFO  - the title slide information about the presenter(s) eg. name(s), role(s)
	PRES_FOOT  - the text for the presenter footer eg. first name(s)
	EMAIL      - the email name prefix for the presenter i.e. <email>@nucypher.com
	EVENT      - the name of the event
	EVENT_DATE - the date of the event with format: dd MMM yyyy
```

Example:
```
make PRES_INFO="MacLane Wilkison, CEO \& Co-Founder" PRES_FOOT="MacLane" EMAIL="maclane" EVENT_DATE="05 Oct 2018" EVENT="ETH SF"
```

### Generate templated slides for non-event specific branch

Run a templated build for non-event specific slide updates (eg. on master or enterprise branches):

```
Usage: make BUILD=template
```
