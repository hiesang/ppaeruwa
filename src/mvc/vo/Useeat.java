package mvc.vo;


public class Useeat {
	private String email;
	private String eatday;
	private String foodname;
	private double kcal;
	private double carbohy;
	private double protein;
	private double fat;
	private double natrium;
	private String time;
	private String time1;
	private String time2;
	
	public Useeat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Useeat(String email, String eatday, String foodname, double kcal, double carbohy, double protein, double fat,
			double natrium, String time) {
		super();
		this.email = email;
		this.eatday = eatday;
		this.foodname = foodname;
		this.kcal = kcal;
		this.carbohy = carbohy;
		this.protein = protein;
		this.fat = fat;
		this.natrium = natrium;
		this.time = time;
	}
	

	public Useeat(String email, String eatday, String foodname, double kcal, double carbohy, double protein, double fat,
			double natrium, String time, String time1, String time2) {
		super();
		this.email = email;
		this.eatday = eatday;
		this.foodname = foodname;
		this.kcal = kcal;
		this.carbohy = carbohy;
		this.protein = protein;
		this.fat = fat;
		this.natrium = natrium;
		this.time = time;
		this.time1 = time;
		this.time2 = time;
	}
	
	
	
	
	
	public Useeat(String email, String time1, String time2) {
		super();
		this.email = email;
		this.time1 = time1;
		this.time2 = time2;
	}
	
	
	
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEatday() {
		return eatday;
	}
	public void setEatday(String eatday) {
		this.eatday = eatday;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public double getKcal() {
		return kcal;
	}
	public void setKcal(double kcal) {
		this.kcal = kcal;
	}
	public double getCarbohy() {
		return carbohy;
	}
	public void setCarbohy(double carbohy) {
		this.carbohy = carbohy;
	}
	public double getProtein() {
		return protein;
	}
	public void setProtein(double protein) {
		this.protein = protein;
	}
	public double getFat() {
		return fat;
	}
	public void setFat(double fat) {
		this.fat = fat;
	}
	public double getNatrium() {
		return natrium;
	}
	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
