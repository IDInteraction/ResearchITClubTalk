.PHONEY: present clean all rpackages

presentationname=MawdsleyJayHainesRSE2017

all: $(presentationname).html 

$(presentationname).html: $(presentationname).Rmd 
	Rscript -e "rmarkdown::render('$<')"

present: $(presentationname).html
	chromium-browser $< &

clean:
	rm -f $(presentationname).html 

rpackages:
	Rscript installRpackages.R

publish: ./docs/index.html

./docs/index.html: $(presentationname).html
	cp $< $@

