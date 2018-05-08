package mvc.vo;

public class Videoply {
	private String email;
	private String nickname;
	private String title;
	private String explan;
	private String fname;
	private long shower;
	private String linker;
	private String time;
	public Videoply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Videoply(String email, String nickname, String title, String explan, String fname, long shower,
			String linker, String time) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.title = title;
		this.explan = explan;
		this.fname = fname;
		this.shower = shower;
		this.linker = linker;
		this.time = time;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getExplan() {
		return explan;
	}
	public void setExplan(String explan) {
		this.explan = explan;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public long getShower() {
		return shower;
	}
	public void setShower(long shower) {
		this.shower = shower;
	}
	public String getLinker() {
		return linker;
	}
	public void setLinker(String linker) {
		this.linker = linker;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}