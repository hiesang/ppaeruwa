package mvc.vo;

import java.util.Date;

public class GoFitness {
	private int bbsid;
	private String email;
	private String nickname;
	private String search;
	private double latitude;
	private double longitude;
	private String content;
	private Date currdate;
	public GoFitness() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoFitness(int bbsid, String email, String nickname, String search, double latitude, double longitude,
			String content, Date currdate) {
		super();
		this.bbsid = bbsid;
		this.email = email;
		this.nickname = nickname;
		this.search = search;
		this.latitude = latitude;
		this.longitude = longitude;
		this.content = content;
		this.currdate = currdate;
	}
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
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
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCurrdate() {
		return currdate;
	}
	public void setCurrdate(Date currdate) {
		this.currdate = currdate;
	}
	
}
