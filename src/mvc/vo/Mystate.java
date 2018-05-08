package mvc.vo;

public class Mystate {

	private String email;
	private String comments;
	public Mystate() {
		super();
	}
	public Mystate(String email, String comments) {
		super();
		this.email = email;
		this.comments = comments;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}
