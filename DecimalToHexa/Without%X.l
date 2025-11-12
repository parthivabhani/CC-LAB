%{
#include <stdio.h>
#include <stdlib.h>  // for atoi()

void printHex(int num) {
    char hex[20];
    int i = 0;

    if (num == 0) {
        printf("0 ");
        return;
    }

    while (num > 0) {
        int rem = num % 16;
        if (rem < 10)
            hex[i++] = '0' + rem;
        else
            hex[i++] = 'A' + (rem - 10);
        num /= 16;
    }

    // print in reverse order (since hex digits were stored backwards)
    for (int j = i - 1; j >= 0; j--)
        printf("%c", hex[j]);
    printf(" ");
}
%}

%%

[0-9]+    {
             int num = atoi(yytext);   // Convert string to integer
             printHex(num);            // Print in manual hex format
          }

[ \t\n]+  ;   // Ignore whitespace
.         ;   // Ignore any other characters

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
