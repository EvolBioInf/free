all: aux data tutorial scripts/cli.sh
aux:
	make -C aux
scripts/cli.sh:
	cp ../pangen/pg/cli.sh scripts	
data:
	bash scripts/getData.sh
tutorial: aux/acc.sh aux/rename.sh aux/var.sh data
	test -d tutorial || mkdir tutorial
	cp aux/*.sh tutorial
	ln -s $$(pwd)/data/* tutorial
aux/acc.sh:
	make -C aux
aux/rename.sh:
	make -C aux
aux/var.sh:
	make -C aux
clean:
	rm -rf data tutorial
	make clean -C aux
