.PHONY: test

all: *.ml *.mli
	obuild configure
	obuild build lib-ptest

test: *.ml *.mli
	obuild configure
	obuild build
	./test

doc:
	mkdir -p doc
	ocamldoc -d doc/ -html ptset.mli

install: all
	obuild install

uninstall:
	ocamlfind -remove ptset

clean:
	obuild clean
	rm -rf doc
