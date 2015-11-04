package semantic;


public class SemanticAnalyzer {
	
	public static boolean checkAssignment(Object n1, Object n2) {
		if (!(n1 instanceof Symbol) || !(n2 instanceof Symbol)) {
			return false;
		}
		
		return true;
	}
	
	public static Variable checkMultiplicativeExp(String operator, Object p1, Object p2) {
		if (!(p1 instanceof Symbol) || !(p2 instanceof Symbol)) {
			return new Variable(null, null, "null", "null");
		}
		
		String p1Type = null, p2Type = null, expType = "error";
		
		if (p1 instanceof Variable) {
			Variable vp1 = (Variable)p1;
			p1Type = vp1.getType();
		} else if (p1 instanceof Function) {
			Function fp1 = (Function)p1;
			p1Type = fp1.getReturnType();
		} else {
			Logger.getInstance().error("Multiplicative expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (p2 instanceof Variable) {
			Variable vp2 = (Variable)p2;
			p2Type = vp2.getType();
		} else if (p2 instanceof Function) {
			Function fp2 = (Function)p2;
			p2Type = fp2.getReturnType();
		} else {
			Logger.getInstance().error("Multiplicative expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (operator.equals(CompilerConstants.MULTIPLICATION_OP) || operator.equals(CompilerConstants.DIVISION_OP)) {
			if(!checkMultiplicativeExpMultAndDivParam(p1Type)) {
				Logger.getInstance().error("Multiplicative expression parameter can only be an int, a float or a double");
				return new Variable(null, null, expType, "null");
			}
			
			if(!checkMultiplicativeExpMultAndDivParam(p2Type)) {
				Logger.getInstance().error("Multiplicative expression [%] parameter can only be an int, a float or a double");
				return new Variable(null, null, expType, "null");
			}
		} else if (operator.equals(CompilerConstants.MODULO_OP)) {
			if (!checkMultiplicativeExpModuloParam(p1Type)) {
				Logger.getInstance().error("Multiplicative expression parameter can only be an int, a float or a double");
				return new Variable(null, null, expType, "null");
			}
			
			if(!checkMultiplicativeExpModuloParam(p2Type)) {
				Logger.getInstance().error("Multiplicative expression parameter can only be an int, a float or a double");
				return new Variable(null, null, expType, "null");
			}
		} else {
			Logger.getInstance().error("Unrecognized Operator for Multiplicative Expression: " + operator);
			return new Variable(null, null, expType, "null");
		}
		
		
		if (p1Type.equals(CompilerConstants.DOUBLE) || p2Type.equals(CompilerConstants.DOUBLE)) expType = CompilerConstants.DOUBLE;
		else if (p1Type.equals(CompilerConstants.FLOATING_LITERAL_TYPE) || p2Type.equals(CompilerConstants.FLOATING_LITERAL_TYPE)) expType = CompilerConstants.FLOAT_TYPE;
		else expType = CompilerConstants.INT_TYPE;
		
		Logger.getInstance().debug("Multiplicative Expression type = " + expType);
		
		return new Variable(null, null, expType, null);
	}
	
	public static Variable checkAdditiveExp(String operator, Object p1, Object p2) {
		if (!(p1 instanceof Symbol) || !(p2 instanceof Symbol)) {
			return new Variable(null, null, "null", "null");
		}
		
		String p1Type = null, p2Type = null, expType = "error";
		
		if (p1 instanceof Variable) {
			Variable vp1 = (Variable)p1;
			p1Type = vp1.getType();
		} else if (p1 instanceof Function) {
			Function fp1 = (Function)p1;
			p1Type = fp1.getReturnType();
		} else {
			Logger.getInstance().error("Additive expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (p2 instanceof Variable) {
			Variable vp2 = (Variable)p2;
			p2Type = vp2.getType();
		} else if (p2 instanceof Function) {
			Function fp2 = (Function)p2;
			p2Type = fp2.getReturnType();
		} else {
			Logger.getInstance().error("Additive expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkAdditiveExpParam(p1Type)) {
			Logger.getInstance().error("Additive expression parameter can only be an int, a float or a double");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkAdditiveExpParam(p2Type)) {
			Logger.getInstance().error("Additive expression parameter can only be an int, a float or a double");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkAdditiveExpOperator(operator)) {
			Logger.getInstance().error("Unrecognized Operator for Additive Expression: " + operator);
			return new Variable(null, null, expType, "null");
		}
		
		if (p1Type.equals(CompilerConstants.DOUBLE) || p2Type.equals(CompilerConstants.DOUBLE)) expType = CompilerConstants.DOUBLE;
		else if (p1Type.equals(CompilerConstants.FLOATING_LITERAL_TYPE) || p2Type.equals(CompilerConstants.FLOATING_LITERAL_TYPE)) expType = CompilerConstants.FLOAT_TYPE;
		else expType = CompilerConstants.INT_TYPE;
		
		Logger.getInstance().debug("Additive Expression type = " + expType);
		
		return new Variable(null, null, expType, null);
	}
	
	public static Variable checkRelationalExp(String operator, Object p1, Object p2) {
		if (!(p1 instanceof Symbol) || !(p2 instanceof Symbol)) {
			return new Variable(null, null, "null", "null");
		}
		
		String p1Type = null, p2Type = null, expType = "error";
		
		if (p1 instanceof Variable) {
			Variable vp1 = (Variable)p1;
			p1Type = vp1.getType();
		} else if (p1 instanceof Function) {
			Function fp1 = (Function)p1;
			p1Type = fp1.getReturnType();
		} else {
			Logger.getInstance().error("Relational expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (p2 instanceof Variable) {
			Variable vp2 = (Variable)p2;
			p2Type = vp2.getType();
		} else if (p2 instanceof Function) {
			Function fp2 = (Function)p2;
			p2Type = fp2.getReturnType();
		} else {
			Logger.getInstance().error("Relational expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkRelationalExpParam(p1Type)) {
			Logger.getInstance().error("Relational expression parameter can only be an int, a float or a double");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkRelationalExpParam(p2Type)) {
			Logger.getInstance().error("Relational expression parameter can only be an int, a float or a double");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkRelationalExpOperator(operator)) {
			Logger.getInstance().error("Unrecognized Operator for Relational Expression: " + operator);
			return new Variable(null, null, expType, "null");
		}
		
		expType = CompilerConstants.BOOL_TYPE;
		
		Logger.getInstance().debug("Relational Expression type = " + expType);
		
		return new Variable(null, null, expType, null);
	}
	
	public static Variable checkEqualityExp(String operator, Object p1, Object p2) {
		if (!(p1 instanceof Symbol) || !(p2 instanceof Symbol)) {
			return new Variable(null, null, "null", "null");
		}
		
		String p1Type = null, p2Type = null, expType = "error";
		
		if (p1 instanceof Variable) {
			Variable vp1 = (Variable)p1;
			p1Type = vp1.getType();
		} else if (p1 instanceof Function) {
			Function fp1 = (Function)p1;
			p1Type = fp1.getReturnType();
		} else {
			Logger.getInstance().error("Equality expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (p2 instanceof Variable) {
			Variable vp2 = (Variable)p2;
			p2Type = vp2.getType();
		} else if (p2 instanceof Function) {
			Function fp2 = (Function)p2;
			p2Type = fp2.getReturnType();
		} else {
			Logger.getInstance().error("Equality expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkEqualityExpParams(p1Type, p2Type)) {
			Logger.getInstance().error("Comparison between " + p1Type + " and " + p2Type + " is not allowed.");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkEqualityExpOperator(operator)) {
			Logger.getInstance().error("Unrecognized Operator for Equality Expression: " + operator);
			return new Variable(null, null, expType, "null");
		}
		
		expType = CompilerConstants.BOOL_TYPE;
		
		Logger.getInstance().debug("Equality Expression type = " + expType);
		
		return new Variable(null, null, expType, null);
	}
	
	public static Variable checkBooleanExp(String operator, Object p1, Object p2) {
		if (!(p1 instanceof Symbol) || !(p2 instanceof Symbol)) {
			return new Variable(null, null, "null", "null");
		}
		
		String p1Type = null, p2Type = null, expType = "error";
		
		if (p1 instanceof Variable) {
			Variable vp1 = (Variable)p1;
			p1Type = vp1.getType();
		} else if (p1 instanceof Function) {
			Function fp1 = (Function)p1;
			p1Type = fp1.getReturnType();
		} else {
			Logger.getInstance().error("Boolean expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (p2 instanceof Variable) {
			Variable vp2 = (Variable)p2;
			p2Type = vp2.getType();
		} else if (p2 instanceof Function) {
			Function fp2 = (Function)p2;
			p2Type = fp2.getReturnType();
		} else {
			Logger.getInstance().error("Boolean expression parameter can only be a literal, a variable or a function");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkBooleanExpParam(p1Type)) {
			Logger.getInstance().error("Boolean expression parameter can only be an integer, a float, a string or a bool");
			return new Variable(null, null, expType, "null");
		}
		
		if (!checkBooleanExpParam(p2Type)) {
			Logger.getInstance().error("Boolean expression parameter can only be an integer, a float, a string or a bool");
			return new Variable(null, null, expType, "null");
		}
		
		expType = CompilerConstants.BOOL_TYPE;
		
		Logger.getInstance().debug("Boolean Expression type = " + expType);
		
		return new Variable(null, null, expType, null);
	}
	
	public static boolean canBeAssignedTo(String type1, String type2) {
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
	
	private static boolean checkMultiplicativeExpMultAndDivParam(String type) {
		if (type.equals(CompilerConstants.INTEGER_LITERAL_TYPE) || 
			type.equals(CompilerConstants.FLOATING_LITERAL_TYPE) ||
			type.equals(CompilerConstants.DOUBLE)) {
			return true;
		}
		
		return false;
	}
	
	private static boolean checkMultiplicativeExpModuloParam(String type) {
		if (type.equals(CompilerConstants.INTEGER_LITERAL_TYPE)) {
			return true;
		}
		
		return false;
	}
	
	private static boolean checkAdditiveExpParam(String type) {
		if ((type.equals(CompilerConstants.INTEGER_LITERAL_TYPE)) || 
			 (type.equals(CompilerConstants.FLOATING_LITERAL_TYPE)) ||
			 (type.equals(CompilerConstants.DOUBLE))) {
			return true;
		}
		
			return false;
	}
	
	private static boolean checkAdditiveExpOperator(String operator) {
		if (operator.equals(CompilerConstants.SUM_OP) ||
				operator.equals(CompilerConstants.SUBTRACTION_OP)) {
			return true;
		}
		return false;
	}
	
	private static boolean checkRelationalExpParam(String type) {
		if ((type.equals(CompilerConstants.INTEGER_LITERAL_TYPE)) || 
			 (type.equals(CompilerConstants.FLOATING_LITERAL_TYPE)) ||
			 (type.equals(CompilerConstants.DOUBLE))) {
			return true;
		}
		
			return false;
	}
	
	private static boolean checkRelationalExpOperator(String operator) {
		if (operator.equals(CompilerConstants.LESS_THAN_OP) || 
				operator.equals(CompilerConstants.GREATER_THAN_OP) ||
				operator.equals(CompilerConstants.LESS_THAN_EQUAL_OP) || 
				operator.equals(CompilerConstants.GREATER_THAN_EQUAL_OP)) {
			return true;
		}
		return false;
	}
	
	private static boolean checkEqualityExpParams(String type1, String type2) {
		if (type1.equals(type2)) {
			return true;
		}
		
		if (type1.equals(CompilerConstants.STRING_LITERAL_TYPE)) {
			return false;
		}
		
		return true;
	}
	
	private static boolean checkEqualityExpOperator(String operator) {
		if (operator.equals(CompilerConstants.EQUAL_OP) || 
				operator.equals(CompilerConstants.NOT_EQUAL_OP)) {
			return true;
		}
		return false;
	}
	
	private static boolean checkBooleanExpParam(String type1) {
		if (type1.equals(CompilerConstants.INTEGER_LITERAL_TYPE) || 
			(type1.equals(CompilerConstants.FLOATING_LITERAL_TYPE)) ||
			(type1.equals(CompilerConstants.STRING_LITERAL_TYPE)) ||
			(type1.equals(CompilerConstants.BOOLEAN_LITERAL_TYPE))) {
			return true;
		}
		
		return false;
	}
	
	private static boolean checkBooleanExpOperator(String operator) {
		if (operator.equals(CompilerConstants.EQUAL_OP) || 
				operator.equals(CompilerConstants.NOT_EQUAL_OP)) {
			return true;
		}
		return false;
	}
	

}
