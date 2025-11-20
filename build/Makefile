DOCS = overview.rst test1.rst cstd.rst minic.rst mystr.rst myconv.rst \
   mystream.rst myprintf.rst myheap.rst myls.rst mytftpd.rst sigcopy.rst \
   cryptserv.rst minishell.rst
SRCDIR = ..
AUXDIR = $(SRCDIR)/aux
DOCSRCDIR = $(SRCDIR)/src

LATEX2PDF = latexmk -pdf -g
RST2HTML = rst2html --syntax-highlight=short --stylesheet-path=aux/min.css --link-stylesheet
RST2LATEX = rst2latex --use-latex-citations --use-latex-docinfo --latex-preamble="" --syntax-highlight=short --template=$(AUXDIR)/template.tex --embed-stylesheet --documentoptions=11pt --stylesheet=$(AUXDIR)/base.sty,$(AUXDIR)/pygments-emacs.sty

all: $(DOCS:.rst=.pdf) $(DOCS:.rst=.html) $(DOCS:.rst=.txt) index.html index.txt
.SUFFIXES: .pdf .ltx .txt .png .html

.PHONY: show-files prune clean
show-files: index.txt
	@echo index.txt index.html $(DOCS:%.rst=%.txt) $(DOCS:%.rst=%.html) $(DOCS:%.rst=%.pdf) aux/min.css

prune:
	rm -f *.log *.ltx *.fls *.fdb_latexmk *.aux *.toc

clean: prune
	rm -f *.pdf *.html *.txt

%.txt: $(DOCSRCDIR)/%.rst
	cp -f $< $@

%.html: %.txt
	rm -f $@.tmp $@
	$(RST2HTML) <$< |  grep -v 'link.*rel.*stylesheet.*html5_polyglot/math.css' >$@.tmp
	mv -f $@.tmp $@

%.ltx: %.txt $(AUXDIR)/base.sty $(AUXDIR)/template.tex
	rm -f $@.tmp $@
	$(RST2LATEX) <$< >$@.tmp
	mv -f $@.tmp $@

%.pdf: %.ltx
	$(LATEX2PDF) $<


METADATA_EXTRACT = analyze() { \
 slug=`basename "$$1" .rst`; \
 title=`head -n 2 "$$1"|tail -n 1|sed -e 's/^ *//g;s/ *$$//g'`; \
 } && analyze


index.txt: $(DOCS:%=$(DOCSRCDIR)/%) $(DOCSRCDIR)/index-header.rst
	rm -f $@.tmp $@
	( cat $(DOCSRCDIR)/index-header.rst; echo; \
	for i in $(DOCS); do \
	$(METADATA_EXTRACT) $(DOCSRCDIR)/$$i; \
	echo "- \`$$title\`__. (also in PDF__ and \`source form\`__)."; \
	echo; \
	echo "  .. __: $$slug.html"; \
	echo "  .. __: $$slug.pdf"; \
	echo "  .. __: $$slug.txt"; \
	echo; \
	done ) >$@.tmp
	mv $@.tmp $@
