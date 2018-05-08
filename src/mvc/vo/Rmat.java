package mvc.vo;

public class Rmat {
	private String fname;
	private String addmat;
	private int addnum;
	public Rmat(String fname, String addmat, int addnum) {
		super();
		this.fname = fname;
		this.addmat = addmat;
		this.addnum = addnum;
	}
	public Rmat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getAddmat() {
		return addmat;
	}
	public void setAddmat(String addmat) {
		this.addmat = addmat;
	}
	public int getAddnum() {
		return addnum;
	}
	public void setAddnum(int addnum) {
		this.addnum = addnum;
	}
	
	
	
}
