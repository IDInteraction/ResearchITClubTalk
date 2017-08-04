.PHONEY: present clean all rpackages publish unpublish

presentationname=MawdsleyJayHainesRSE2017
pubdoc=./docs/index.html
figures=$(wildcard figs/*.png) $(wildcard figs/*.jpg)

all: $(presentationname).html 
	echo $(figures)

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
	rm $(pubdoc)
	rm -f ./docs/figs/*.png
	@echo "Now commit and push to unpublish presentation"

