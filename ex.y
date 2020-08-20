%{
void yyerror (char *s);
int yylex();
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
%}

%union {int num;}
%start line
%token print
%token <num> number
%type <num> line term

%%

line : print term ';'		{printf("Hello %d\n", $2);}
     | line print term ';'	{printf("Helllllo %d\n", $3);}
     ;

term : number			{$$ = $1;}
     ;

%%

int main (void) {
	return yyparse();
}

void yyerror (char *s) {fprintf(stderr, "an error %s\n", s);}
