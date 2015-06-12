/* Analisador lexico para a disciplina de Compiladores 
2015.1 - Grupo : Caio Batista
                 Carlos Interaminense
                 Rafael Paulino
*/
                 
package analisador;

import java_cup.runtime.*;

%%

%class Lexer
%line
%column
%cup


%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }
%}


/* Definicao de palavras/strings, digitos/numeros e espacos
    em branco para utilizacao das regras mais abaixo */ 

L = [a-zA-Z_]
D = [0-9]
WHITE=[ \t\r\n]


%%

/* Simbolos terminais que serao utilizados pelo analisador
   sintatico (CUP) */

<YYINITIAL> {
  
  /* palavras reservadas de java*/
  "class"         {return symbol(sym.CLASS);}
  "extends"       {return symbol(sym.EXTENDS);}
  "implements"    {return symbol(sym.IMPLEMENTS);}
  "interface"     {return symbol(sym.INTERFACE);}
  "new"           {return symbol(sym.NEW);}
  "break"         {return symbol(sym.BREAK);}
  "case"          {return symbol(sym.CASE);}
  "continue"      {return symbol(sym.CONTINUE);}
  "default"       {return symbol(sym.DEFAULT);}
  "do"            {return symbol(sym.DO);}
  "if"            {return symbol(sym.IF);}
  "else"          {return symbol(sym.ELSE);}
  "for"           {return symbol(sym.FOR);}
  "return"        {return symbol(sym.RETURN);}
  "switch"        {return symbol(sym.SWITCH);}
  "while"         {return symbol(sym.WHILE);}
  "assert"        {return symbol(sym.ASSERT);}
  "try"           {return symbol(sym.TRY);}
  "catch"         {return symbol(sym.CATCH);}
  "finally"       {return symbol(sym.FINALLY);}
  "throw"         {return symbol(sym.THROW);}
  "throws"        {return symbol(sym.THROWS);}
  "import"        {return symbol(sym.IMPORT);}
  "package"       {return symbol(sym.PACKAGE);}
  "byte"          {return symbol(sym.BYTE);}
  "const"         {return symbol(sym.CONST);}
  
  "abstract"      {return symbol(sym.ABSTRACT);}
  "final"         {return symbol(sym.FINAL);}
  "native"        {return symbol(sym.NATIVE);}
  "synchronized"  {return symbol(sym.SYNCHRONIZED);}
  "transient"     {return symbol(sym.TRANSIENT);}
  "volatile"      {return symbol(sym.VOLATILE);}
  "strictfp"      {return symbol(sym.STRICTFP);}
  "public"        {return symbol(sym.PUBLIC);}
  "protected"     {return symbol(sym.PROTECTED);}
  "private"       {return symbol(sym.PRIVATE);}
  "static"        { return symbol(sym.STATIC);}
  "void"          {return symbol(sym.VOID);}

  "null"          {return symbol(sym.NULL); }  
 // "super"         {return symbol(sym.SUPER); }
  "this"          {return symbol(sym.THIS); }
  "instanceof"    {return symbol(sym.INSTANCEOF); }


/* Tipos primitivos de java */
  "boolean"       {return symbol(sym.BOOLEAN); }
  "byte"          {return symbol(sym.BYTE); }
  "char"          {return symbol(sym.CHAR); }
  "short"         {return symbol(sym.SHORT); }
  "int"           {return symbol(sym.INT); }
  "float"         {return symbol(sym.FLOAT); }
  "long"          {return symbol(sym.LONG); }
  "double"        {return symbol(sym.DOUBLE);}
  "String"        {return symbol(sym.STRING);}
  
  /* Literais booleanos */
  
  "true"          {return symbol(sym.TRUE);}
  "false"         {return symbol(sym.FALSE);}
 
 
 /* Separadores */
  "("             {return symbol(sym.LPAREN);}
  ")"             {return symbol(sym.RPAREN);}
  "{"             {return symbol(sym.LBRACE);}
  "}"             {return symbol(sym.RBRACE);}
  "["             {return symbol(sym.LBRACK);}
  "]"             {return symbol(sym.RBRACK);}
  ";"             {return symbol(sym.SEMICOLON);}
  ","             {return symbol(sym.COMMA);}
  "."             {return symbol(sym.DOT);}
 
 /* operadores relacionais e booleanos */
  "="             {return symbol(sym.EQUAL); }
  ">"             {return symbol(sym.GREATER); }
  "<"             {return symbol(sym.LESS); }
  "!"             {return symbol(sym.NOT); }
  "~"             {return symbol(sym.BITNOT); }
  "?"             {return symbol(sym.QUESTION); }
  ":"             {return symbol(sym.COLON); }
  "=="            {return symbol(sym.EQEQ); }
  "<="            {return symbol(sym.LTEQ); }
  ">="            {return symbol(sym.GTEQ); }
  "!="            {return symbol(sym.NOTEQ); }
  "&&"            {return symbol(sym.ANDAND); }
  "||"            {return symbol(sym.OROR); }
  "++"            {return symbol(sym.PLUSPLUS); }
  "--"            {return symbol(sym.MINUSMINUS); }
  "+"             {return symbol(sym.PLUS); }
  "-"             {return symbol(sym.MINUS); }
  "*"             {return symbol(sym.MULT); }
  "/"             {return symbol(sym.DIV); }
  "&"             {return symbol(sym.AND); }
  "|"             {return symbol(sym.OR); }
  "^"             {return symbol(sym.XOR); }
  "%"             {return symbol(sym.MOD); }
  "<<"            {return symbol(sym.LSHIFT); }
  ">>"            {return symbol(sym.RSHIFT); }
  ">>>"           {return symbol(sym.URSHIFT); }
  ">>>="          {return symbol(sym.URSHIFTEQ);}
  "+="            {return symbol(sym.PLUSEQ); }
  "-="            {return symbol(sym.MINUSEQ); }
  "*="            {return symbol(sym.MULTEQ); }
  "/="            {return symbol(sym.DIVEQ); }
  "&="            {return symbol(sym.ANDEQ); }
  "|="            {return symbol(sym.OREQ); }
  "^="            {return symbol(sym.XOREQ); }
  "%="            {return symbol(sym.MODEQ); }
  "<<="           {return symbol(sym.LSHIFTEQ); }
  ">>="           {return symbol(sym.RSHIFTEQ); }

  
  /* Definicao de espaco em branco, id, numero e comentario */

  {WHITE} {/*Ignore*/}
  {L}({L}|{D})* {return symbol(sym.ID);}
  ("(-"{D}+")")|{D}+ {return symbol(sym.NUMERO);}
 
    ( "//" | "/*" | "*/")     {lexeme = yytext(); return COMENTARIO;}
}


/* Caracteres Especiais */
/*(\b | "\t" | "\n" | "\f")   {lexeme = yytext(); return ESPECIAL;} */

/* Comentarios */


[^]              { throw new RuntimeException("Illegal character \""+yytext()+
                             "\" at line "+yyline+", column "+yycolumn); }
