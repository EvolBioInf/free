all: aux data tutorial scripts/cli.sh
aux:
	make -C aux
scripts/cli.sh:
	make -C ../pangen/pg
	cp ../pangen/pg/cli.sh scripts	
data:
	bash scripts/getData.sh
tutorial: aux/acc.sh aux/rename.sh aux/nu.sh data scripts/cli.sh
	test -d tutorial || mkdir tutorial
	cp aux/*.sh tutorial
	cp ../pangen/pg/cli.sh scripts
	ln -s $$(pwd)/data/* tutorial
aux/acc.sh:
	make -C aux
aux/rename.sh:
	make -C aux
aux/nu.sh:
	make -C aux
clean:
	rm -rf data tutorial
	make clean -C aux
