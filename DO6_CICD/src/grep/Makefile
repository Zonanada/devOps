CC = gcc
FLAGS=-Wall -Werror -Wextra -std=c11 -g #-fsanitize=address

.PHONY:	all clean re

all: s21_grep

test: s21_grep
	chmod +x script.sh
	./script.sh

s21_grep: s21_grep.c
	$(CC) $(FLAGS) s21_grep.c -o s21_grep 


check: s21_grep.c
ifeq ("","$(wildcard ./CPPLINT.cfg)") # если файла нет, копируем его.
	cp -f ../../materials/linters/CPPLINT.cfg ./CPPLINT.cfg
endif
	python3 ../../materials/linters/cpplint.py --extensions=c *.c
	-rm CPPLINT.cfg


clean: 
	-rm -f s21_grep t1.txt t2.txt result.txt

re: clean all