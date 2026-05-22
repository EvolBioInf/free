nw = $(shell which noweb)

all: acc.sh var.sh rename.sh
acc.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Racc.sh > acc.sh;\
	fi
var.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Rvar.sh > var.sh;\
	fi
rename.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Rrename.sh > rename.sh;\
	fi
clean:
	rm -f *.sh
