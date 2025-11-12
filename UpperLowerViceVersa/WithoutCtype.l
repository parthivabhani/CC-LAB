%{
#include <stdio.h>
%}

%%

[a-z]   { printf("%c", yytext[0] - 32); }     /* Convert lowercase to uppercase */
[A-Z]   { printf("%c", yytext[0] + 32); }     /* Convert uppercase to lowercase */
.|\n    { printf("%s", yytext); }             /* Print everything else unchanged */

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
