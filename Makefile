DOCS = overview.rst test1.rst cstd.rst minic.rst mystr.rst myconv.rst \
   mystream.rst myprintf.rst myheap.rst myls.rst mytftpd.rst sigcopy.rst \
   cryptserv.rst minishell.rst

LATEX2PDF = latexmk -pdf -g
RST2HTML = rst2html --syntax-highlight=short --stylesheet-path=aux/min.css --link-stylesheet
RST2LATEX = rst2latex --use-latex-citations --use-latex-docinfo --latex-preamble="" --syntax-highlight=short --template=aux/template.tex --embed-stylesheet --documentoptions=11pt --stylesheet=aux/base.sty,aux/pygments-emacs.sty

all: $(DOCS:.rst=.pdf) $(DOCS:.rst=.html) index.html index.rst
.SUFFIXES: .pdf .ltx .txt .png .html

.PHONY: show-files
show-files:
	@for i in $(DOCS:.rst=); do if test -d $$i; then echo $$i; fi; done
	@echo index.txt index.html  $(DOCS:.rst=.txt) $(DOCS:.rst=.html) $(DOCS:.rst=.pdf) aux/min.css

%.txt: %.rst
	ln -sf $< $@

%.html: %.rst
	rm -f $@.tmp $@
	$(RST2HTML) <$< |  grep -v 'link.*rel.*stylesheet.*html5_polyglot/math.css' >$@.tmp
	mv -f $@.tmp $@

%.ltx: %.rst aux/base.sty aux/template.tex
	rm -f $@.tmp $@
	$(RST2LATEX) <$< >$@.tmp
	mv -f $@.tmp $@

%.pdf: %.ltx
	$(LATEX2PDF) $<


METADATA_EXTRACT = analyze() { \
 slug=`basename "$$1" .rst`; \
 title=`head -n 2 "$$1"|tail -n 1|sed -e 's/^ *//g;s/ *$$//g'`; \
 } && analyze


index.rst: $(DOCS) index-header.rst
	rm -f $@.tmp $@
	( cat index-header.rst; echo; \
	for i in $(DOCS); do \
	$(METADATA_EXTRACT) $$i; \
	echo "- \`$$title\`__. (also in PDF__ and \`source form\`__)."; \
	echo; \
	echo "  .. __: $$slug.html"; \
	echo "  .. __: $$slug.pdf"; \
	echo "  .. __: $$slug.txt"; \
	echo; \
	done ) >$@.tmp
	mv $@.tmp $@
