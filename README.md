# RSE2017Talk
## Presentation for the RSE conference in Manchester Sept 2017

The talk is written in RMarkdown, as a revealjs presentation. 

To build it you will need to install R and pandoc.

The presentation requires that the rmarkdown and revealjs R packages are installed.  As a convenience this can be done with:

`make rpackages`   

The presentation can be built with 

`make`

To view the presentation locally:
`make present`

To publish to github pages (where it will appear at [http://idinteraction.cs.manchester.ac.uk/RSE2017Talk/](http://idinteraction.cs.manchester.ac.uk/RSE2017Talk/)):

`make publish` and then commit and push

To take the presentation down:

`make unpublish` and then commit and push

It takes a few minutes after pushing the (un)published repository for it to update on github pages.

(I will switch to using Travis to publish once the repository is public)
