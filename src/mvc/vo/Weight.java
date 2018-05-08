package mvc.vo;

public class Weight {
private String email;
private double weight;
private String wdate;



public Weight(String email, double weight, String wdate) {
	super();
	this.email = email;
	this.weight = weight;
	this.wdate = wdate;
}
public Weight() {
	super();
	// TODO Auto-generated constructor stub
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public double getWeight() {
	return weight;
}
public void setWeight(double weight) {
	this.weight = weight;
}
public String getWdate() {
	return wdate;
}
public void setWdate(String wdate) {
	this.wdate = wdate;
}


}
