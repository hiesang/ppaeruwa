package mvc.vo;

public class GoSport {
	private String email;
	private String nickname;
	private String search;
	private String content;
	public GoSport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoSport(String email, String nickname, String search, String content) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.search = search;
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
