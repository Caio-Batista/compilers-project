JAVA=java
JAVAC=javac
PATH_JFLEX=jflex-1.6.1/bin/jflex
PATH_CUPJAR=jflex-1.6.1/lib/java-cup-11a.jar
CUP=$(JAVA) -jar $(CUPJAR) <
CP=.:$(CUPJAR)

run: 
	$(PATH_JFLEX) java_flex.flex
	java -jar $(PATH_CUPJAR) -interface -parser JavaParser java.cup
	javac -classpath $(PATH_CUPJAR):. Main.java
	java -classpath $(PATH_CUPJAR):. Main test.java

clean:
	rm -f Lexer.java JavaParser.java sym.java *.class *~
