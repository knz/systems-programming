DOCS = cstd.rst test1.rst overview.rst minic.rst mystr.rst myconv.rst \
   mystream.rst myprintf.rst myheap.rst myls.rst mytftpd.rst sigcopy.rst \
   cryptserv.rst

LATEX2PDF = latexmk -pdf -g
RST2HTML = rst2html --syntax-highlight=short --stylesheet-path=aux/min.css --link-stylesheet
RST2LATEX = rst2latex --use-latex-citations --use-latex-docinfo --latex-preamble="" --syntax-highlight=short --template=aux/template.tex --embed-stylesheet --documentoptions=11pt --stylesheet=aux/base.sty,aux/pygments-emacs.sty

all: $(DOCS:.rst=.pdf) $(DOCS:.rst=.html)
.SUFFIXES: .pdf .ltx .txt .png .html

%.html: %.rst
	rm -f $@.tmp $@
	$(RST2HTML) <$< >$@.tmp
	mv -f $@.tmp $@

%.ltx: %.rst aux/base.sty aux/template.tex
	rm -f $@.tmp $@
	$(RST2LATEX) <$< >$@.tmp
	mv -f $@.tmp $@

%.pdf: %.ltx
	$(LATEX2PDF) $<
