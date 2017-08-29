.PHONEY: present clean all rpackages publish unpublish clean

presentationname=MawdsleyJayHainesRSE2017
pubdoc=./docs/index.html
figures=$(wildcard figs/*.png) $(wildcard figs/*.jpg)

all: $(presentationname).html 

$(presentationname).html: $(presentationname).Rmd $(figures)
	Rscript -e "rmarkdown::render('$<')"

present: $(presentationname).html
	chromium-browser $< &

clean:
	rm -f $(presentationname).html 

rpackages:
	Rscript installRpackages.R

publish: $(pubdoc)

$(pubdoc): $(presentationname).html $(figures)
	cp $< $@
	cp $(wordlist 2, 9999, $^) ./docs/figs/
	@echo "Now commit and push to publish changes"

unpublish:
	rm -f $(pubdoc)
	rm -f ./docs/figs/*.png ./docs/figs/*.jpg
	@echo "Now commit and push to unpublish presentation"


pdf:
	@echo "To convert to pdf, make publish and then go to"
	@echo "http://idinteraction.cs.manchester.ac.uk/RSE2017Talk/?print-pdf#/"
	@echo "using Chrome(ium), and then print to pdf"
