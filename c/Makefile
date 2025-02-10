.PHONY: all clean
all: rge1

rge1: rge1.c
	clang -Wall -Wextra -O3 -ffast-math -std=c23 $^ -o $@

clean:
	rm rge1
