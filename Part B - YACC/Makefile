parser: y.tab.c
	gcc -o parser y.tab.c
y.tab.c: cs315f08_group25.y lex.yy.c
	yacc cs315f08_group25.y
lex.yy.c: cs315f08_group25.l
	lex cs315f08_group25.l
