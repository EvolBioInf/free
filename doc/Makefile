SRC1 = aux.tex
SRC2 = free.tex header.tex intro.tex ref.bib

date = $(shell git log | grep -m 1 Date | sed -r 's/Date: +[A-Z][a-z]+ ([A-Z][a-z]+) ([0-9]+) [^ ]+ ([0-9]+) .+/\2_\1_\3/')
version = $(shell git describe)

all: $(SRC1) free.pdf 
%.tex:	../*/%.org free.tex
	bash ../scripts/org2nw $<  | noweave -n -x > $@
free.pdf: free.tex $(SRC1) $(SRC2)
	echo $(date) | tr '_' ' ' > date.txt
	echo $(version) | tr '-' ' ' | awk '{printf "%s", $$1; if ($$2) printf "-%s", $$2; printf "\n"}' > version.txt
	latex free.tex
	bibtex free
	latex free.tex
	latex free.tex
	dvipdf -dALLOWPSTRANSPARENCY free
publish: free.pdf
	if [ -d ~/WinHome/ownCloud/ ]; then \
		cp free.pdf ~/WinHome/ownCloud/docs/; \
	fi
clean:
	rm -f free.aux free.bbl free.blg free.dvi free.log free.out free.pdf free.toc $(SRC1) version.txt date.txt
