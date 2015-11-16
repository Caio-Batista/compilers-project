package semantic;

public class Variable extends ProceduralSymbol {

	String type;
	Object value;

	public Variable(String lexeme, Context context, String type,
			Object value) {
		super(lexeme, context);
		this.type = type;
		this.value = value;
	}


	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();

		sb.append(getType());
		sb.append(" ");
		sb.append(getLexeme());
		sb.append(" = ");
		sb.append(getValue());

		return sb.toString();
	}

}
