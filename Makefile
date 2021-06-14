ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif


all: diagnostics word html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file
PANDOC_OPTS=-V geometry:margin=1in --pdf-engine=xelatex 


diagnostics: Diagnostics.md 
	R ${R_OPTS} -e 'library(knitr); knit("Diagnostics.Rmd");'
	pandoc Diagnostics.md -o diagnostics.pdf --template my.tex ${PANDOC_OPTS}
	open diagnostics.pdf
word: Diagnostics.md 
	R ${R_OPTS} -e 'library(knitr); knit("Diagnostics.Rmd");'
	pandoc Diagnostics.md -o diagnostics.docx 
html: Diagnostics.md 
	R ${R_OPTS} -e 'library(knitr); knit("Diagnostics.Rmd");'
	pandoc Diagnostics.md -o diagnostics.html ${PANDOC_OPTS}
	
clean:
	$(RM) Diagnostics.md 
	$(RM) diagnostics.pdf 
