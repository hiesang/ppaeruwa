package mvc.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class Diary {

	private String email;
	private int no;
	private String comments;
	private String wdate;
	private int available;
	private int publickey;
	private MultipartFile[] report;
	private ArrayList<TimelineFileVO> fnames;
	private ArrayList<Reply> reply;
	private int likecnt;
	private int myclickcheck;
	private String mymail;
	private int mytagstate;
	private String name;
	private String profile;
	
	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt,
			int myclickcheck, String mymail, int mytagstate, String name, String profile) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
		this.myclickcheck = myclickcheck;
		this.mymail = mymail;
		this.mytagstate = mytagstate;
		this.name = name;
		this.profile = profile;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt,
			int myclickcheck, String mymail, int mytagstate, String name) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
		this.myclickcheck = myclickcheck;
		this.mymail = mymail;
		this.mytagstate = mytagstate;
		this.name = name;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt,
			int myclickcheck, String mymail, int mytagstate) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
		this.myclickcheck = myclickcheck;
		this.mymail = mymail;
		this.mytagstate = mytagstate;
	}


	public int getMytagstate() {
		return mytagstate;
	}


	public void setMytagstate(int mytagstate) {
		this.mytagstate = mytagstate;
	}


	public String getMymail() {
		return mymail;
	}


	public void setMymail(String mymail) {
		this.mymail = mymail;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt,
			int myclickcheck, String mymail) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
		this.myclickcheck = myclickcheck;
		this.mymail = mymail;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt,
			int myclickcheck) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
		this.myclickcheck = myclickcheck;
	}


	public int getMyclickcheck() {
		return myclickcheck;
	}


	public void setMyclickcheck(int myclickcheck) {
		this.myclickcheck = myclickcheck;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply, int likecnt) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
		this.likecnt = likecnt;
	}


	public int getLikecnt() {
		return likecnt;
	}


	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames, ArrayList<Reply> reply) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
		this.reply = reply;
	}


	public ArrayList<Reply> getReply() {
		return reply;
	}


	public void setReply(ArrayList<Reply> reply) {
		this.reply = reply;
	}


	public Diary(String comments, String wdate, int publickey, MultipartFile[] report, ArrayList<TimelineFileVO> fnames) {
		super();
		this.comments = comments;
		this.wdate = wdate;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
	}


	public Diary(String email, int no, String comments, String wdate, int available, int publickey,
			MultipartFile[] report, ArrayList<TimelineFileVO> fnames) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
		this.report = report;
		this.fnames = fnames;
	}


	public MultipartFile[] getReport() {
		return report;
	}


	public void setReport(MultipartFile[] report) {
		this.report = report;
	}


	public ArrayList<TimelineFileVO> getFnames() {
		return fnames;
	}


	public void setFnames(ArrayList<TimelineFileVO> fnames) {
		this.fnames = fnames;
	}


	public Diary(String comments, String wdate, int publickey) {
		super();
		this.comments = comments;
		this.wdate = wdate;
		this.publickey = publickey;
	}


	public Diary(String comments, int publickey) {
		super();
		this.comments = comments;
		this.publickey = publickey;
	}


	public Diary() {
		super();
	}
	
	
	public Diary(String email, int no, String comments, String wdate, int available, int publickey) {
		super();
		this.email = email;
		this.no = no;
		this.comments = comments;
		this.wdate = wdate;
		this.available = available;
		this.publickey = publickey;
	}
	
	public Diary(String comments) {
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
	public int getPublickey() {
		return publickey;
	}
	public void setPublickey(int publickey) {
		this.publickey = publickey;
	}
	
	
	

}
