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
  "try"           {return symbol(sym.TRY);}
  "catch"         {return symbol(sym.CATCH);}
  "finally"       {return symbol(sym.FINALLY);}
  "throw"         {return symbol(sym.THROW);}
  "import"        {return symbol(sym.IMPORT);}
  "package"       {return symbol(sym.PACKAGE);}
  "byte"          {return symbol(sym.BYTE);}
  
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
  "super"         {return symbol(sym.SUPER); }
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

  {decIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new Integer(yytext())); }
  {decLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new Long(yytext().substring(0, yylength()-1))); }
  {hexIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new Integer((int) Long.parseLong(yytext().substring(2, yylength()), 16))); }
  {hexLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new Long( Long.parseLong(yytext().substring(2, yylength()-1), 16))); }
  {octIntLiteral}           { return symbol(sym.INTEGER_LITERAL, new Integer((int) Long.parseLong(yytext().substring(0, yylength()), 8))); }
  {octLongLiteral}          { return symbol(sym.INTEGER_LITERAL, new Long( Long.parseLong(yytext().substring(0, yylength()-1), 8))); }
  {floatLiteral}            { return symbol(sym.FLOAT_LITERAL, new Float(yytext()));}
  {floatLiteral}[fF]        { return symbol(sym.FLOAT_LITERAL, new Float(yytext().substring(0, yylength()-1))); }  
  {floatLiteral}[dD]        { return symbol(sym.FLOAT_LITERAL, new Double(yytext().substring(0, yylength()-1))); }  

  /* Definicao de espaco em branco, id, numero e comentario */

  {WHITE}      {/*Ignore*/}
  {comentario} {/*Ignore*/}
  {Identifier} {return symbol(sym.ID);} 
}


<STRING>{
  \"                             { yybegin(YYINITIAL);
                                   return symbol(sym.STRING_LITERAL, 
                                                 string.toString()); }
  
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
