PATH_JFLEX=jflex-1.6.1/bin/jflex
PATH_CUPJAR=jflex-1.6.1/lib/java-cup-11a.jar

run: 
	$(PATH_JFLEX) java_lex.flex
	java -jar $(PATH_CUPJAR) -parser parser java_cup_cup.cup
	javac -classpath $(PATH_CUPJAR):. Main.java
	java -classpath $(PATH_CUPJAR):. Main test.java

clean:
	rm -f Lexer.java parser.java sym.java *.class *~
