%option yylineno

%{
    #include<stdio.h>
	#include"y.tab.h"
%}

%%


"#include"([ ]+)?((<(\\.|[^>])+>)|(\"(\\.|[^"])+\"))    {return HEADER;}
"for"                                                   {return FOR;}
"while"                                                 {return WHILE;}
"return"                                                {return RETURN;}
"int"|"string"                                          {return TYPE;}
\"(\\.|[^\"])*\"                                        {return STRING;}
"//"(\\.|[^\n])*[\n]                                    ;
[0-9]+                                                  {return DIGIT;}
[a-zA-z_][a-zA-z_0-9]*	                                {return ID;}
[/][*]([^*]|[*]*[^*/])*[*]+[/]                          ;
[ \t\n]                                                 ;

%%

int yywrap(void)
{
    return 1;
}