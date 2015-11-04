package semantic;

public abstract class ProceduralSymbol extends Symbol {
	
	public ProceduralSymbol(String lexeme, Context context) {
		super(lexeme);
		this.context = context;
		// TODO Auto-generated constructor stub
	}
	
	private Context context;

	public Context getContext() {
		return context;
	}

	public void setContext(Context context) {
		this.context = context;
	}
}
