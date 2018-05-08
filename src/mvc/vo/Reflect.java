package mvc.vo;

//반성일기 VO
public class Reflect {
	private String email;
	private int no;
	private String wdate;
	private String comments;
	private int available;
	
	public Reflect() {
		super();
	}
	
	public Reflect(String email, int no, String wdate, String comments, int available) {
		super();
		this.email = email;
		this.no = no;
		this.wdate = wdate;
		this.comments = comments;
		this.available = available;
	}

	public Reflect(String comments) {
		super();
		this.comments = comments;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}
	
	

}
