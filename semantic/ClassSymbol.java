package semantic;

public class ClassSymbol extends Symbol {
	private String className;

	public ClassSymbol(String className) {
		super(className);
		this.className = className;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
}
