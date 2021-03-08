%{
    #include<stdio.h>
	int yylex(void);
    int yyerror(const char *s);
    int success = 1;
%}

%token HEADER FOR WHILE RETURN TYPE STRING DIGIT ID
%%
program : HEADER

%%

int main()
{
    yyparse();
    if(success)
    	printf("Parsing Successful\n");
    return 0;
}

int yyerror(const char *msg)
{
    extern int yylineno;
	printf("Parsing Failed\nLine Number: %d %s\n",yylineno,msg);
	success = 0;
	return 0;
}