package analisador;


import static analisador.Token.*;
%%
%class Lexer
%type Token

L = [a-zA-Z_]
D = [0-9]
WHITE=[ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}

/* Operadores Aritméticos */

( "+" | "-" | "*" | "/" | "%" )    {lexeme = yytext(); return OPERADOR_ARITMETICO;}

/* Operadores Lógicos */
("&&" | "||" | "!" | "&" | "|" )    {lexeme = yytext(); return OPERADOR_LOGICO;}

/*Operadores Relacionais */
(">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>")   {lexeme = yytext(); return OP_RELACIONAL;}

/* Operadores Atribuição */
("+=" | "-="  | "*=" | "/=" | "%=" | "++" | "--" | "=")      {lexeme = yytext(); return OP_ATRIBUICAO;}

/*Operadores Booleanos*/
(true | false)      {lexeme=yytext(); return OP_BOOLEANO;}

/*Separadores */
("(" | ")" | "{" | "}" | "[" | "]" | ";" | "," |  "." |  "\"")      {lexeme = yytext(); return SEPARADOR;}

/* Caracteres Especiais */
/*(\b | "\t" | "\n" | "\f")   {lexeme = yytext(); return ESPECIAL;} */

/* Comentarios */
( "//" | "/*" | "*/")     {lexeme = yytext(); return COMENTARIO;}

/* 52 palavras reservadas de java */
(private | protected | public | abstract | class | extends | final
 | implements | interface | native | new | static | strictfp | synchronized
 | transient | volatile | break | case | continue | default | do | else
 | for | if | instanceof | return | switch | while | assert | catch | finally
 | throw | throws | try | import | package | boolean | byte | char | double
 | float | int | long | short | super | this | void | const | goto 
 | null | String ) {lexeme = yytext(); return PALAVRA;}


{L}({L}|{D})* {lexeme=yytext(); return ID;}
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return NUMERO;}

