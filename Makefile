.PHONEY: present clean all rpackages publish unpublish clean

presentationname=ReproducibleResearchIsRSE
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




pdf:
	@echo "To convert to pdf, make publish and then go to"
	@echo "http://idinteraction.cs.manchester.ac.uk/RSE2017Talk/?print-pdf#/"
	@echo "using Chrome(ium), and then print to pdf"
	@echo "For full instructions, see https://github.com/hakimel/reveal.js#pdf-export"
