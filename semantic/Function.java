package semantic;

import java.util.ArrayList;
import java.util.List;


public class Function extends ProceduralSymbol {
	public Function(String lexeme, Context context, String returnType) {
		super(lexeme, context);
		this.setReturnType(returnType);
	}

	private List<Parameter> parameters;
	private String returnType;
	
	public Parameter getParameter(String name) {
		for (Parameter p : parameters) {
			if (p.getLexeme().equals(name)) {
				return p;
			}
		}
		return null;
	}
	
	public void addParameter(Parameter p) {
		parameters.add(p);
	}
	public List<Parameter> getParameters() {
		return parameters;
	}
	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	
	public boolean equals(Object obj) {
		if (!(obj instanceof Function))
			return false;
		Function f = (Function) obj;
		
		if (!(f.getLexeme().equals(getLexeme()))) 
			return false;
		
		if (!(f.getReturnType().equalsIgnoreCase(getReturnType()))) 
			return false;
		
		if (!(f.getParameters().size() == getParameters().size())) 
			return false;
		
		for (int i = 0; i < f.getParameters().size(); i++) {
			if (!(f.getParameters().get(i).getType().equalsIgnoreCase(getParameters().get(i).getType()))) // Parametros com tipos diferentes
				return false;
		}
		
		return true;
	}
	
	
}
