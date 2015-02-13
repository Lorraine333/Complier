LEX = lex
YACC = yacc
LIBS = -ly -lfl
CC = gcc -g

first: first.l first.y
	${LEX} first.l
	${YACC} -d first.y
	${CC} -o first y.tab.c lex.yy.c ${LIBS}
