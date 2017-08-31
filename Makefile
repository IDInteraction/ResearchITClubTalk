.PHONEY: present clean all rpackages publish unpublish clean exampledoc

presentationname=ReproducibleResearchIsRSE
pubdoc=./docs/index.html
figures=$(wildcard figs/*.png) $(wildcard figs/*.jpg) 
SUBDIRS=example

all:  $(presentationname).html 

exampledoc:
	$(MAKE) -C example

$(presentationname).html: $(presentationname).Rmd 
	Rscript -e "rmarkdown::render('$<')"

$(presentationname).Rmd: $(figures) exampledoc
	
subdirs: $(SUBDIRS)

present: $(presentationname).html
	chromium-browser $< &

clean:
	rm -f $(presentationname).html 

rpackages:
	Rscript installRpackages.R




pdf:
	@echo "To convert to pdf, push the repository to github,"
	@echo "wait for Travis to build the presentation and then go to"
	@echo "http://idinteraction.cs.manchester.ac.uk/RSE2017Talk/ReproducibleResearchIsRSE.html?print-pdf#/"
	@echo "using Chrome(ium), and then print to pdf"
	@echo "For full instructions, see https://github.com/hakimel/reveal.js#pdf-export"
