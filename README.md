# NuCypher Slides

### Build Requirements
* Inkscape: <https://inkscape.org>
* XeLaTeX

### Generate slides for	a specific event
```
Usage: make [TITLE_FOOT=<presentation_title_footer>] PRES=<presenter_names_roles> PRES_FOOT=<presenter_footer> EMAIL=<email_name> EVENT_DATE=<dd MMM yyyy> EVENT=<event>
where
	TITLE_FOOT - the footer title of the presentation (optional - default is 'NuCypher')
	PRES       - the name(s) of the presenter(s) and optional role for the title slide
	PRES_FOOT  - the text for the presenter footer eg. first name
	EMAIL      - the email name prefix for the presenter i.e. <email>@nucypher.com
	EVENT      - the name of the event
	EVENT_DATE - the date of the event with format: dd MMM yyyy
```
### Generate templated slides for non-event specific branch

Run a templated build for non-event specific slide updates (eg. on master or enterprise branches):

```
Usage: make BUILD=template
```
