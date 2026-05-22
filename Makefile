all: data
	make -C aux
	test -d tutorial || mkdir tutorial
	cp aux/*.sh tutorial
	ln -s $$(pwd)/data/* tutorial
data:
	bash scripts/getData.sh
