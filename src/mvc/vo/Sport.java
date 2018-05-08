package mvc.vo;

public class Sport {
	private String sports;
	private double mets;
	public Sport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sport(String sports, double mets) {
		super();
		this.sports = sports;
		this.mets = mets;
	}
	public String getSports() {
		return sports;
	}
	public void setSports(String sports) {
		this.sports = sports;
	}
	public double getMets() {
		return mets;
	}
	public void setMets(double mets) {
		this.mets = mets;
	}
	
}
