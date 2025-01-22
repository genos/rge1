.PHONY: all clean
LISP ?= sbcl

all: go

go: rge1
	./rge1 1000000

rge1: rge1.asd rge1.lisp package.lisp
	$(LISP) --load rge1.asd \
		--eval '(ql:quickload :rge1)' \
		--eval '(asdf:make :rge1)' \
		--eval '(quit)'

clean:
	rm rge1
