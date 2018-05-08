package mvc.vo;

public class Rproc {

	private String fname;
	private int pnum;
	private String proce;
	public Rproc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rproc(String fname, int pnum, String proce) {
		super();
		this.fname = fname;
		this.pnum = pnum;
		this.proce = proce;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getProce() {
		return proce;
	}
	public void setProce(String proce) {
		this.proce = proce;
	}
	   
	   
	   
	
}
