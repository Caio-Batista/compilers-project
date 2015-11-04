package semantic;

public class Logger {
	
	public static final int DEBUG = 3, INFO = 2, ERROR = 1, OFF = 0;
	private int loggingLevel = DEBUG;
	
	private static Logger LOGGER;
	
	private Logger() {};
	
	public static Logger getInstance() {
		if (LOGGER == null) {
			LOGGER = new Logger();
		}
		
		return LOGGER;
	}
	
	public void setLoggingLevel(int loggingLevel) {
		this.loggingLevel = loggingLevel;
	}
	
	public int getLoggingLevel() {
		return loggingLevel;
	}
	
	public void debug(String message) {
		if (loggingLevel >= DEBUG) {
			System.out.println(message);
		}
	}
	
	public void info(String message) {
		if (loggingLevel >= INFO) {
			System.out.println(message);
		}
	}
	
	public void error(String message) {
		if (loggingLevel >= ERROR) {
			System.err.println("Error: " + message);
		}
	}

}
