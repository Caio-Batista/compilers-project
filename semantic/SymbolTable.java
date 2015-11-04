package semantic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class SymbolTable {
	
	private static SymbolTable sTable;
	private Map<String, Symbol> symbols;
	
	private SymbolTable() {
		symbols = new HashMap<String, Symbol>();
	}
	
	public static SymbolTable getInstance() {
		if (sTable == null) {
			sTable = new SymbolTable();
		}
		
		return sTable;
	}
	
	public int size(){
		return sTable.size();
	}
	public SymbolTable getSymbol() {
		return this.sTable;
	}
	
	public Map<String, Symbol>  getSymbols() {
		return this.symbols;
	}
	
	public Variable addVariable(Variable v) {
		symbols.put(v.getLexeme(), v);
		return v;
	}
	
	public void addVariableList(String type, List<Variable> variables) {
		if (type == null || variables == null) return;
		
		for (Variable v : variables) {
//			System.out.println("Lexeme:" + currVariableLexeme + "--");
			if (!canBeAssignedTo(v.getType(),type)) {
				Logger.getInstance().error(v.getType() + " expression cannot be assigned to " + type + " variable.");
				return;
			}
			
			Variable v1 = new Variable(v.getLexeme(), null, type, null);
			
			symbols.put(v1.getLexeme(),v1);
			Logger.getInstance().debug("Added variable [" + v1.toString() + "] to symbol table.");
		}
	}

	private boolean canBeAssignedTo(String type1, String type2) {
		if (type1.equals(type2)) {
			return true;
		}
		
		if (type1.equals(CompilerConstants.CHARACTER_LITERAL_TYPE)) {
			if (!type2.equals(CompilerConstants.INTEGER_LITERAL_TYPE)) {
				return false;
			}
		}
		
		if (type2.equals(CompilerConstants.CHARACTER_LITERAL_TYPE)) {
			if (!type1.equals(CompilerConstants.INTEGER_LITERAL_TYPE)) {
				return false;
			}
		}
		
		return true;
	}

}