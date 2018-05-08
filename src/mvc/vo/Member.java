package mvc.vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String email;
	private String password;
	private String nickname;
	private String name;
	private int gender;
	private String tel;
	private double weight;
	private double goalw;
	private int goalk;
	private String birth;
	private String address;
	private int height;
	private String profile;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String email, String password, String nickname, String name, int gender, String tel, double weight,
			double goalw, int goalk, String birth, String address, int height, String profile) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.gender = gender;
		this.tel = tel;
		this.weight = weight;
		this.goalw = goalw;
		this.goalk = goalk;
		this.birth = birth;
		this.address = address;
		this.height = height;
		this.profile = profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getGoalw() {
		return goalw;
	}

	public void setGoalw(double goalw) {
		this.goalw = goalw;
	}

	public int getGoalk() {
		return goalk;
	}

	public void setGoalk(int goalk) {
		this.goalk = goalk;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
