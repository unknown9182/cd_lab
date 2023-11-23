%{
#include <stdio.h>
%}

%option noyywrap

%%

int|float|double|char|void       { printf("Keyword: %s\n", yytext); }
[_a-zA-Z][_a-zA-Z0-9]*           { printf("Identifier: %s\n", yytext); }
[+\-*/=<>!&|]                    { printf("Operator: %s\n", yytext); }
[0-9]+(\.[0-9]+)?                { printf("Number: %s\n", yytext); }
[ \t\n]                          ; // Ignore whitespace characters
.                                { printf("Invalid: %s\n", yytext); }

%%

int main()
{
    yyin = fopen("input.c", "r");
    if (yyin == NULL)
    {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }

    yylex();

    fclose(yyin);

    return 0;
}