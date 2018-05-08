package mvc.vo;

public class Tosport {
	private String email;
	private String sport;
	private int stime;
	private double skcal;
	private String sdate;
	public Tosport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tosport(String email, String sports, int stime, double skcal, String sdate) {
		super();
		this.email = email;
		this.sport = sports;
		this.stime = stime;
		this.skcal = skcal;
		this.sdate = sdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSport() {
		return sport;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	public int getStime() {
		return stime;
	}
	public void setStime(int stime) {
		this.stime = stime;
	}
	public double getSkcal() {
		return skcal;
	}
	public void setSkcal(double skcal) {
		this.skcal = skcal;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
}
