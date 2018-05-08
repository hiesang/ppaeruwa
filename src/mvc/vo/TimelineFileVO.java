package mvc.vo;

public class TimelineFileVO {
	
	private String imgname;
	private String email;
	private int dno;
	private int fno;
	private String fdate;
	
	
	public TimelineFileVO() {
		super();
	}
	public TimelineFileVO(String imgname, String email, int dno, int fno, String fdate) {
		super();
		this.imgname = imgname;
		this.email = email;
		this.dno = dno;
		this.fno = fno;
		this.fdate = fdate;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
}
