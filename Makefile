all: *.ml *.mli
	obuild configure
	obuild build

doc:
	mkdir -p doc
	ocamldoc -d doc/ -html ptset.mli

install: all
	obuild install

uninstall:
	ocamlfind -remove ptset

clean:
	obuild clean
