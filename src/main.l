%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"

%}


%%
 /*String*/
["]([a-zA-Z0-9])*["] {
  return ELEMENT;
}

 /*Palavra*/
([a-zA-Z])+ {
  return ELEMENT;
}

 /*Numero inteiro*/
([0-9])+ {
  return ELEMENT;
}  

 /*virgular e colchetes*/
[,\[\]]  {
  return *yytext;
}
 
 /*Ignora espaços*/
[ \t] ;

 /*Ignora quebra de linha*/
[ \n] ;
%%


int yywrap() {
  return 1;
}
