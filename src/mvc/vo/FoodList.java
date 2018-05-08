package mvc.vo;

public class FoodList {
	private String foodname;
	private int oneeat;
	private double kcal;
	private double carbohy;
	private double protein;
	private double fat;
	private double suger;
	private double natrium;
	
	public FoodList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodList(String foodname, int oneeat, double kcal, double carbohy, double protein, double fat, double suger,
			double natrium) {
		super();
		this.foodname = foodname;
		this.oneeat = oneeat;
		this.kcal = kcal;
		this.carbohy = carbohy;
		this.protein = protein;
		this.fat = fat;
		this.suger = suger;
		this.natrium = natrium;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public int getOneeat() {
		return oneeat;
	}

	public void setOneeat(int oneeat) {
		this.oneeat = oneeat;
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

	public double getSuger() {
		return suger;
	}

	public void setSuger(double suger) {
		this.suger = suger;
	}

	public double getNatrium() {
		return natrium;
	}

	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}
	
	
}
