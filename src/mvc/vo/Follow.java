package mvc.vo;

public class Follow {
	//나를 누군가(myemail)
	private String follower;
	//내가 누군가(owner)를
	private String following;
	
	public Follow() {
		super();
	}
	public Follow(String follower, String following) {
		super();
		this.follower = follower;
		this.following = following;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
}
