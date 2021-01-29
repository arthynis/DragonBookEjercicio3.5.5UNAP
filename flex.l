%{
    #include <stdio.h>
    #define SELECTSQL       1;
    #define FROMSQL         2;
    #define WHERESQL        3;
    #define ID              4;
%}
select  (s|S)(e|E)(l|L)(e|E)(c|C)(t|T)
from    (f|F)(r|R)(o|O)(m|M)
where   (w|W)(h|H)(e|E)(r|R)(e|E)
letras  [A-Za-z]
digito  [0-9]
id      {letras}({letras}|{digito}|_)*

%%
{select}    return SELECTSQL;
{from}      return FROMSQL;
{where}     return WHERESQL;
{id}        return ID;
%%

int yywrap()
{
    return 1;
}
int main()
{
    int token;
    int value;
    printf("<<Por favor ingrese una sentencia de SQL:  >>\n");
    token = yylex();
    while(token)
    {
        if(token == 1)
        {
            printf("<<Cadena SQL aceptada>> \n");
            printf("<<Tipo Token: %d \t Lexema de entrada: %s \t Lexema aceptado: SELECT>> \n", token, yytext);
            token = yylex();
        }

        if(token == 2)
        {
            printf("<<Cadena SQL aceptada>> \n");
            printf("<<Tipo Token: %d \t Lexema de entrada: %s \t Lexema aceptado: FROM>> \n", token, yytext);
            token = yylex();
        }
        
        if(token == 3)
        {
            printf("<<Cadena SQL aceptada>> \n");
            printf("<<Tipo Token: %d \t Lexema de entrada: %s \t Lexema aceptado: WHERE>> \n", token, yytext);
            token = yylex();
        }
        
        if(token == 4)
        {
            printf("<<Secuencia aleatoria no aceptada>> \n");
            printf("<<Tipo Token: %d \t Lexema de entrada: %s >> \n", token, yytext);
            token = yylex();
        }
    }
    return 0;
}