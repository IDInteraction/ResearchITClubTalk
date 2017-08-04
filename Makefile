.PHONEY: present clean all rpackages publish unpublish

presentationname=MawdsleyJayHainesRSE2017
pubdoc=./docs/index.html

all: $(presentationname).html 

$(presentationname).html: $(presentationname).Rmd 
	Rscript -e "rmarkdown::render('$<')"

present: $(presentationname).html
	chromium-browser $< &

clean:
	rm -f $(presentationname).html 

rpackages:
	Rscript installRpackages.R

publish: $(pubdoc)

$(pubdoc): $(presentationname).html
	cp $< $@
	@echo "Now commit and push to publish changes"

unpublish:
	rm $(pubdoc)
	@echo "Now commit and push to unpublish presentation"

