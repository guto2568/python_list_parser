%token ELEMENT

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int OK = 1;
%}

%%

List:
  '[' CommaSeparatedElement ']'
  |
  '[' ']'
  ;

CommaSeparatedElement:
  ELEMENT
  | CommaSeparatedElement ',' CommaSeparatedElement
  | List
  ;

%%

void yyerror(char *s) {
    fprintf(stdout, "ERRO\n");
    OK = 0;
}


int main() {
  yyparse();
  if(OK)
    printf("OK\n");
  return 0;

}
