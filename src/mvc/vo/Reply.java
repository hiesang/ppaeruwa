package mvc.vo;

public class Reply {
	private String targetmail;
	private int no;
	private int refno;
	private String mymail;
	private String comments;
	private String wdate;
	private int available;
	private String nickname;
	private String profile;
	
	public Reply(String targetmail, int no, int refno, String mymail, String comments, String wdate, int available,
			String nickname, String profile) {
		super();
		this.targetmail = targetmail;
		this.no = no;
		this.refno = refno;
		this.mymail = mymail;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.nickname = nickname;
		this.profile = profile;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Reply(String targetmail, int no, int refno, String mymail, String comments, String wdate, int available,
			String nickname) {
		super();
		this.targetmail = targetmail;
		this.no = no;
		this.refno = refno;
		this.mymail = mymail;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.nickname = nickname;
	}
	public Reply(String targetmail, int no, String mymail, String comments) {
		super();
		this.targetmail = targetmail;
		this.no = no;
		this.mymail = mymail;
		this.comments = comments;
	}
	public Reply() {
		super();
	}
	public Reply(String targetmail, int no, int refno, String mymail, String comments, String wdate, int available) {
		super();
		this.targetmail = targetmail;
		this.no = no;
		this.refno = refno;
		this.mymail = mymail;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
	}
	public String getTargetmail() {
		return targetmail;
	}
	public void setTargetmail(String targetmail) {
		this.targetmail = targetmail;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getMymail() {
		return mymail;
	}
	public void setMymail(String mymail) {
		this.mymail = mymail;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
}
