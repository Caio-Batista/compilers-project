import java.util.ArrayList;
import java.util.Map;


import semantic.*;

public class CodeGen {
	
//	private static ArrayList<Simbolo> registradores = new ArrayList<Simbolo>();
	private static ArrayList<Symbol> funcoes = new ArrayList<Symbol>();
	
	public static String getNextLabel(Symbol s) {
		funcoes.add(s);
		
		return "L" + funcoes.indexOf(s);
	}
	
	public static String Go() {
		String result = "";
		/*	
		for (Simbolo s : TabelaSimbolos.getInstance().getSimbolos()) {
			result += getNextLabel(s) + "(" + s.getLexema() +"):\n" + GenContext(s);
			
			if (s.getLexema().equalsIgnoreCase("main")){
				result = result + "halt;\n";
			}
			else {
				result = result + "BR *(0)SP;\n";
			}
			
		}
		return result;
	}*/
		
		Map<String,Symbol> symbols = SymbolTable.getInstance().getSymbols(); 
		
		for (String lexeme : symbols.keySet()) {
			Symbol s = symbols.get(lexeme);
		
			//result += getNextLabel(s) + "(" + s.getLexeme() +"):\n" + genContext(s);
			
			if (s.getLexeme().equalsIgnoreCase("main")){
				result = result + "halt;\n";
			}
			else {
				result = result + "BR *(0)SP;\n";
			}
		}
		
		return result;
	}
	
	/*public static String genContext(Symbol s) {
		String result = "";
		ArrayList<Symbol> registradores = new ArrayList<Symbol>();
		
		Function funcao = (Function) s;
		
		for (Symbol a : funcao.getSymbol()) {
			if (a instanceof Variavel) {
				result += GenAttrInitializer(a, registradores);
			} else if (a instanceof CallFunction) {
				result += GenCallFun(a, registradores);
			} else if (a instanceof Attr) {
				result += GenAttr(a, registradores);
			}
		}
		return result;
	}
	*/
	
	private static String GenAttr(Symbol s, ArrayList<Symbol> registradores) {
		String result = "";
		
	
		Variable v = (Variable) s;
		
		result += "ST " + v.getLexeme() + ", #" + v.getValue() + "\n"; 
		
		return result;
	}

	private static String getLabel(Symbol s) {
		for (int i = 0; i < funcoes.size(); i++) {
			if (funcoes.get(i).getLexeme().equals(s.getLexeme())) {
				return "L" + i;
			}
		}
		
		return null;
	}
	
	private static String GenCallFun(Symbol s, ArrayList<Symbol> registradores) {
		registradores.add(s);
		
		String result = "";
		
		result += "ADD SP, SP, #" + s.getLexeme() + "size;\n";
		result += "ST *SP, #here+16" + ";\n";
		result += "BR " + getLabel(s) + ";\n";
		result += "SUB SP, SP, #" + s.getLexeme() + "size;\n";
		
		return result;
	}

	public static String GenAttrInitializer(Symbol s, ArrayList<Symbol> registradores) {
		registradores.add(s);
		
		String result = "";
		
		result += "ST R" + registradores.indexOf(s) + ", " + s.getLexeme() + ";\n"; 
		
		return result;
	}
}

