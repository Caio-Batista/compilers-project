package analisador;

import java.io.File;

public class Analisador {
	
	
	
	public static void main(String[] args) {
		
		String path = "C:/Users/Claudionor/workspace3/AnalisadorLexico/src/analisador/Lexer.flex";
		gerarLexer(path);
		
		
	}
	
	
	public static void gerarLexer(String path){
		
		File file = new File(path);
		jflex.Main.generate(file);
		
	}

}
