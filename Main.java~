/** Test class to try out the command lexer. */
import java.io.*;

public class Main {
	public static void main(String args[]) throws Exception {
		try {
		   JavaParser p = new JavaParser(new Lexer(new FileReader(args[0])));
		   Object result = p.parse().value;
		} catch (Exception e) {
			e.printStackTrace();
		}/*
	   do {
	       token = command_lexer.;
	       System.out.println("token = " + token);
	   }
	   while (result!=null);*/
	}
}
