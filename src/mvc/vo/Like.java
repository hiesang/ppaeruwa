package mvc.vo;

public class Like {
	private String targetmail;
	private String mymail;
	private int no;
	private int likecnt;
	
	
	
	
	public Like(String targetmail, String mymail, int no, int likecnt) {
		super();
		this.targetmail = targetmail;
		this.mymail = mymail;
		this.no = no;
		this.likecnt = likecnt;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public Like() {
		super();
	}
	public Like(String targetmail, String mymail, int no) {
		super();
		this.targetmail = targetmail;
		this.mymail = mymail;
		this.no = no;
	}
	public String getTargetmail() {
		return targetmail;
	}
	public void setTargetmail(String targetmail) {
		this.targetmail = targetmail;
	}
	public String getMymail() {
		return mymail;
	}
	public void setMymail(String mymail) {
		this.mymail = mymail;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
}
