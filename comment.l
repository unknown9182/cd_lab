%{
#include <stdio.h>
FILE *yyin;
FILE *yyout;
int sl=0;
int ml=0;
%}

%%
"/*"([^*]|"*"+[^*/])*"*"+"/"  { ml++; }
"//".* {sl++;}
.|\n { fprintf(yyout, "%s", yytext); }
%%

int main()
{
    yyin = fopen("f1.c", "r");
    yyout = fopen("f2.c", "w");

    if (yyin == NULL || yyout == NULL)
    {
        fprintf(stderr, "Error opening files\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Comments removed. Output saved in 'f2.c'\n");
    printf("No of multi-line comments are %d",ml);
    printf("\nNo of single-line comments are %d\n",sl);

    return 0;
}