%option yylineno

%{
    #include<stdio.h>
%}

%%


"#include"([ ]+)?((<(\\.|[^>])+>)|(\"(\\.|[^"])+\"))    {printf("header\t%s\n", yytext);}
"for"                                                   {printf("for\t%s\n", yytext);}
"while"                                                 {printf("while\t%s\n", yytext);}
"return"                                                {printf("return\t%s\n", yytext);}
"int"|"string"                                          {printf("TYPE\t%s\n",yytext);}
\"(\\.|[^\"])*\"                                        {printf("STRING\t%s\n",yytext);}
"//"(\\.|[^\n])*[\n]                                    ;
[0-9]+                                                  {printf("digit\t%s\n", yytext);}
[a-zA-z_][a-zA-z_0-9]*	                                {printf("id\t%s\n", yytext);}
[/][*]([^*]|[*]*[^*/])*[*]+[/]                          ;
[ \t\n]                                                 ;

%%

int main( argc, argv )
int argc;
char **argv;
    {
    ++argv, --argc;  /* skip over program name */
    if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;

    yylex();
    }