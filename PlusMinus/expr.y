%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%%
expr:
      expr '+' term   { printf("%d + %d = %d\n", $1, $3, $1 + $3); $$ = $1 + $3; }
    | expr '-' term   { printf("%d - %d = %d\n", $1, $3, $1 - $3); $$ = $1 - $3; }
    | term
    ;

term:
      NUMBER
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an expression (like 5+3-2):\n");
    yyparse();
    return 0;
}

