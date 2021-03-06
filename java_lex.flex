/* Analisador lexico para a disciplina de Compiladores 
2015.1 - Grupo : Caio Batista
                 Carlos Interaminense
                 Rafael Paulino
*/
                 


import java_cup.runtime.*;
%%

%class Lexer
%line
%column

%cupsym sym

%cup


%{
  StringBuilder string = new StringBuilder();  

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}


/* Definicao de palavras/strings, digitos/numeros e espacos
    em branco para utilizacao das regras mais abaixo */ 
StringCharacter = [^\r\n\"\\]
LineTerminator = \r|\n|\r\n

WHITE={LineTerminator} | [ \t\f]
Identifier = [:jletter:][:jletterdigit:]*

comentario = "/*" [^*] ~"*/" | "/*" "*"+ "/" | "//" [^\r\n]* {LineTerminator}? |  "/*" "*"+ [^/*] ~"*/"

decIntLiteral = 0 | [1-9][0-9]*
decLongLiteral    = {decIntLiteral} [lL]
hexIntLiteral = 0 [xX] 0* [0-9a-fA-F] {1,8}
hexLongLiteral    = 0 [xX] 0* [0-9a-fA-F] {1,16} [lL]
octIntLiteral = 0+ [1-3]? [0-7] {1,15}
octLongLiteral    = 0+ 1? [0-7] {1,21} [lL]

floatLiteral  = ([0-9]+ \. [0-9]*
		|\. [0-9]+
		|[0-9]+) [eE] [+-]? [0-9]+?

%state STRING


%%

/* Simbolos terminais que serao utilizados pelo analisador
   sintatico (CUP) */

<YYINITIAL> {
  
  /* palavras reservadas de java*/
  "class"         {return symbol(sym.CLASS, new String(yytext()));}
  "extends"       {return symbol(sym.EXTENDS, new String(yytext()));}
  "implements"    {return symbol(sym.IMPLEMENTS, new String(yytext()));}
  "interface"     {return symbol(sym.INTERFACE, new String(yytext()));}
  "new"           {return symbol(sym.NEW, new String(yytext()));}
  "break"         {return symbol(sym.BREAK, new String(yytext()));}
  "case"          {return symbol(sym.CASE, new String(yytext()));}
  "continue"      {return symbol(sym.CONTINUE, new String(yytext()));}
  "default"       {return symbol(sym.DEFAULT, new String(yytext()));}
  "do"            {return symbol(sym.DO, new String(yytext()));}
  "if"            {return symbol(sym.IF, new String(yytext()));}
  "else"          {return symbol(sym.ELSE, new String(yytext()));}
  "for"           {return symbol(sym.FOR, new String(yytext()));}
  "return"        {return symbol(sym.RETURN, new String(yytext()));}
  "switch"        {return symbol(sym.SWITCH, new String(yytext()));}
  "while"         {return symbol(sym.WHILE, new String(yytext()));}
  "try"           {return symbol(sym.TRY, new String(yytext()));}
  "catch"         {return symbol(sym.CATCH, new String(yytext()));}
  "finally"       {return symbol(sym.FINALLY, new String(yytext()));}
  "throw"         {return symbol(sym.THROW, new String(yytext()));}
  "import"        {return symbol(sym.IMPORT, new String(yytext()));}
  "package"       {return symbol(sym.PACKAGE, new String(yytext()));}
  "byte"          {return symbol(sym.BYTE, new String(yytext()));}
  
  "abstract"      {return symbol(sym.ABSTRACT, new String(yytext()));}
  "final"         {return symbol(sym.FINAL, new String(yytext()));}
  "native"        {return symbol(sym.NATIVE, new String(yytext()));}
  "synchronized"  {return symbol(sym.SYNCHRONIZED, new String(yytext()));}
  "transient"     {return symbol(sym.TRANSIENT, new String(yytext()));}
  "volatile"      {return symbol(sym.VOLATILE, new String(yytext()));}
  "strictfp"      {return symbol(sym.STRICTFP, new String(yytext()));}
  "public"        {return symbol(sym.PUBLIC, new String(yytext()));}
  "protected"     {return symbol(sym.PROTECTED, new String(yytext()));}
  "private"       {return symbol(sym.PRIVATE, new String(yytext()));}
  "static"        { return symbol(sym.STATIC, new String(yytext()));}
  "void"          {return symbol(sym.VOID, new String(yytext()));}

  "null"          {return symbol(sym.NULL, new String(yytext())); }  
  "super"         {return symbol(sym.SUPER, new String(yytext())); }
  "this"          {return symbol(sym.THIS, new String(yytext())); }
  "instanceof"    {return symbol(sym.INSTANCEOF, new String(yytext())); }


/* Tipos primitivos de java */
  "boolean"       {return symbol(sym.BOOLEAN, new String(yytext())); }
  "byte"          {return symbol(sym.BYTE, new String(yytext())); }
  "char"          {return symbol(sym.CHAR, new String(yytext())); }
  "short"         {return symbol(sym.SHORT, new String(yytext())); }
  "int"           {return symbol(sym.INT, new String(yytext())); }
  "float"         {return symbol(sym.FLOAT, new String(yytext())); }
  "long"          {return symbol(sym.LONG, new String(yytext())); }
  "double"        {return symbol(sym.DOUBLE, new String(yytext()));}
  "String"        {return symbol(sym.STRING, new String(yytext()));}
  
  /* Literais booleanos */
  
  "true"          {return symbol(sym.TRUE, new String(yytext()));}
  "false"         {return symbol(sym.FALSE, new String(yytext()));}
 
 
 /* Separadores */
  "("             {return symbol(sym.LPAREN, new String(yytext()));}
  ")"             {return symbol(sym.RPAREN, new String(yytext()));}
  "{"             {return symbol(sym.LBRACE, new String(yytext()));}
  "}"             {return symbol(sym.RBRACE, new String(yytext()));}
  "["             {return symbol(sym.LBRACK, new String(yytext()));}
  "]"             {return symbol(sym.RBRACK, new String(yytext()));}
  ";"             {return symbol(sym.SEMICOLON, new String(yytext()));}
  ","             {return symbol(sym.COMMA, new String(yytext()));}
  "."             {return symbol(sym.DOT, new String(yytext()));}
 
 /* operadores relacionais e booleanos */
  "="             {return symbol(sym.EQUAL, new String(yytext())); }
  ">"             {return symbol(sym.GREATER, new String(yytext())); }
  "<"             {return symbol(sym.LESS, new String(yytext())); }
  "!"             {return symbol(sym.NOT, new String(yytext())); }
  "~"             {return symbol(sym.BITNOT, new String(yytext())); }
  "?"             {return symbol(sym.QUESTION, new String(yytext())); }
  ":"             {return symbol(sym.COLON, new String(yytext())); }
  "=="            {return symbol(sym.EQEQ, new String(yytext())); }
  "<="            {return symbol(sym.LTEQ, new String(yytext())); }
  ">="            {return symbol(sym.GTEQ, new String(yytext())); }
  "!="            {return symbol(sym.NOTEQ, new String(yytext())); }
  "&&"            {return symbol(sym.ANDAND, new String(yytext())); }
  "||"            {return symbol(sym.OROR, new String(yytext())); }
  "++"            {return symbol(sym.PLUSPLUS, new String(yytext())); }
  "--"            {return symbol(sym.MINUSMINUS, new String(yytext())); }
  "+"             {return symbol(sym.PLUS, new String(yytext())); }
  "-"             {return symbol(sym.MINUS, new String(yytext())); }
  "*"             {return symbol(sym.MULT, new String(yytext())); }
  "/"             {return symbol(sym.DIV, new String(yytext())); }
  "&"             {return symbol(sym.AND, new String(yytext())); }
  "|"             {return symbol(sym.OR, new String(yytext())); }
  "^"             {return symbol(sym.XOR, new String(yytext())); }
  "%"             {return symbol(sym.MOD, new String(yytext())); }
  "<<"            {return symbol(sym.LSHIFT, new String(yytext())); }
  ">>"            {return symbol(sym.RSHIFT, new String(yytext())); }
  ">>>"           {return symbol(sym.URSHIFT, new String(yytext())); }
  "+="            {return symbol(sym.PLUSEQ, new String(yytext())); }
  "-="            {return symbol(sym.MINUSEQ, new String(yytext())); }
  "*="            {return symbol(sym.MULTEQ, new String(yytext())); }
  "/="            {return symbol(sym.DIVEQ, new String(yytext())); }
  "&="            {return symbol(sym.ANDEQ, new String(yytext())); }
  "|="            {return symbol(sym.OREQ, new String(yytext())); }
  "^="            {return symbol(sym.XOREQ, new String(yytext())); }
  "%="            {return symbol(sym.MODEQ, new String(yytext())); }
  "<<="           {return symbol(sym.LSHIFTEQ, new String(yytext())); }
  ">>="           {return symbol(sym.RSHIFTEQ, new String(yytext())); }

  {decIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {decLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {hexIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {hexLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {octIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {octLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new String(yytext())); }
  {floatLiteral}            { return symbol(sym.FLOAT_LITERAL, new String(yytext()));}
  {floatLiteral}[fF]        { return symbol(sym.FLOAT_LITERAL, new String(yytext())); }  
  {floatLiteral}[dD]        { return symbol(sym.FLOAT_LITERAL, new String(yytext())); }  

  /* Definicao de espaco em branco, id, numero e comentario */

  {WHITE}      {/*Ignore*/}
  {comentario} {/*Ignore*/}
  {Identifier} {return symbol(sym.ID, new String(yytext()));} 
}


<STRING>{
  \"                             { yybegin(YYINITIAL);
                                   return symbol(sym.STRING_LITERAL, new String(yytext())); }
  
  {StringCharacter}+             { string.append( yytext() ); }
  
  "\\b"                          { string.append( '\b' ); }
  "\\t"                          { string.append( '\t' ); }
  "\\n"                          { string.append( '\n' ); }
  "\\f"                          { string.append( '\f' ); }
  "\\r"                          { string.append( '\r' ); }
  "\\\""                         { string.append( '\"' ); }
  "\\'"                          { string.append( '\'' ); }
  "\\\\"                         { string.append( '\\' ); }

  \\.                            { throw new RuntimeException(
                                  "Illegal escape sequence \""+yytext()+"\""); }
  {LineTerminator}               { throw new RuntimeException(
                                       "Unterminated string at end of line"); }  
}

[^]              { throw new RuntimeException("Illegal character \""+yytext()+
                             "\" at line "+yyline+", column "+yycolumn); }
