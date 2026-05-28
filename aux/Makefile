nw = $(shell which noweb)

all: acc.sh nu.sh rename.sh
acc.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Racc.sh > acc.sh;\
	fi
nu.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Rnu.sh > nu.sh;\
	fi
rename.sh: aux.org
	if [ "$(nw)" != "" ]; then\
		bash ../scripts/org2nw aux.org | notangle -Rrename.sh > rename.sh;\
	fi
clean:
	rm -f *.sh
