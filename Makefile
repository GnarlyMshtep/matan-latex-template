texsrc = $(wildcard *.tex)
TMP = $(texsrc:.tex=.aux) $(texsrc:.tex=.blg) $(texsrc:.tex=.bbl) $(texsrc:.tex=.log) $(texsrc:.tex=.out) $(texsrc:.tex=.idx)

all: paper

paper: paper.tex
	pdflatex paper.tex
	biber paper
	pdflatex paper.tex

clean:
	rm -f $(TMP)
	rm -f sections/*.aux
	rm paper.pdf
	rm -rf out

SOURCE = references.bib
TIMESTAMP_FILE = .last_ref_build_timestamp

.PHONY: all

all: $(TARGET)

# only run biber if references has changed
mpaper: paper.tex
	@if [ ! -f $(TIMESTAMP_FILE) ] || [ $(SOURCE) -nt $(TIMESTAMP_FILE) ]; then \
		make paper; \
		if [ -f $(TIMESTAMP_FILE) ]; then \
			rm $(TIMESTAMP_FILE); \
		fi; \
		touch $(TIMESTAMP_FILE); \
	else \
		pdflatex paper.tex; \
	fi	