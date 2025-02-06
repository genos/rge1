.PHONY: all clean
all: rge1

rge1: rge1.cc
	clang++ -Wall -Wextra -O3 -std=c++23 $^ -o $@

clean:
	rm rge1
