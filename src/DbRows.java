
public class DbRows {
	private String spending;
	private String purpose;
	private String method;
	private String time;
	
	
	public DbRows(String spending, String purpose, String method, String time) {
		super();
		this.spending = spending;
		this.purpose = purpose;
		this.method = method;
		this.time = time;
	}
	public String getSpending() {
		return spending;
	}
	public void setSpending(String spending) {
		this.spending = spending;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	

}
