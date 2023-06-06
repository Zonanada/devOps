CC= gcc
FLAGS=-Wall -Werror -Wextra -std=c11 -g #-fsanitize=address 

.PHONY:	all clean re

all: s21_cat

test: s21_cat
	chmod +x script.sh
	./script.sh

s21_cat: s21_cat.c
	$(CC) $(FLAGS) s21_cat.c -o s21_cat

check: s21_cat.c
ifeq ("","$(wildcard ./CPPLINT.cfg)") # если файла нет, копируем его.
	cp -f ../../materials/linters/CPPLINT.cfg ./CPPLINT.cfg
endif
	python3 ../../materials/linters/cpplint.py --extensions=c *.clean
	-rm CPPLINT.cfg
	
clean: 
	-rm -f s21_cat t1.txt t2.txt result.txt

re: clean all

