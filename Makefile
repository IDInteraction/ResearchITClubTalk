.PHONEY: present clean all

presentationname=MawdsleyJayHainesRSE2017

all: $(presentationname).html 

$(presentationname).html: $(presentationname).Rmd 
	Rscript -e "rmarkdown::render('$<')"

present: $(presentationname).html
	chromium-browser $< &

clean:
	rm -f $(presentationname).html 

