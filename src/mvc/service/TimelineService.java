package mvc.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mvc.repository.DiaryDAO;
import mvc.repository.MemberDAO;
import mvc.vo.Diary;
import mvc.vo.Follow;
import mvc.vo.Like;
import mvc.vo.Member;
import mvc.vo.Mystate;
import mvc.vo.Reflect;
import mvc.vo.Reply;
import mvc.vo.TimelineFileVO;

@Service
public class TimelineService {
	@Autowired(required=false)
	private DiaryDAO ddao;
	
	@Autowired(required=false)
	private MemberDAO ddao2;
	
	public void diaryinsert(Diary diary) {
		ddao.diaryinsert(diary);
		String beforeFileName =""; 
		String imgtype =""; 
		
		if(diary.getReport()[0].getOriginalFilename()!="") { //입력한 사진이 있을때만 업로드되도록.
			for(MultipartFile report:diary.getReport() ) {
				beforeFileName = report.getOriginalFilename();
				if(beforeFileName.endsWith(".jpg")) {
					imgtype = ".jpg";
				}else if(beforeFileName.endsWith(".png")) {
					imgtype = ".png";
				}else if(beforeFileName.endsWith(".PNG")) {
					imgtype = ".PNG";
				}
				ddao.insertRepo(diary.getEmail(),imgtype); //DB에 입력된 사진파일의 이름이 "게시글번호_고유번호.확장자"로 만들기 위해
			}											//확장자 String을 담은 변수도 같이 파라미터로 입력.
			ArrayList<TimelineFileVO> agofile = ddao.timg(diary); //timg()는 방금전 입력된 파일 이름'들'을 호출하는 메소드
			upload(diary.getReport(), agofile);
		}
	}
	
	public Mystate stateinsert(Mystate state) {
		Mystate st = new Mystate();
		if(ddao.mscheck(state)==0) {
			ddao.stateinsert(state);
			st = ddao.selectms(state);
		}else {
			ddao.msmodify(state);
			st = ddao.selectms(state);
		}
		return st;
	}
	
	public Mystate basestate(String email) {
		Mystate a= new Mystate();
		a.setEmail(email);
		return ddao.selectms(a);
	}
	
	public ArrayList<Diary> timelinelist(Diary diary) {
		ArrayList<Diary> timeline = ddao.timelinelist(diary);
		String wdatechange = "";
		String wdatechangemm ="";
		String wdatechangedd ="";
		String wdatechangett ="";
		for(Diary inputArray: timeline) { //각 글에대한 댓글 ArrayList를 입력하기위한 과정.
			ArrayList<Reply> FN = ddao.replyoutputAll(inputArray);
			for(Reply a: FN) { 
				a.setNickname(ddao2.findNick(a.getMymail()));
				a.setProfile((ddao2.profileImg(a.getMymail())).substring(ddao2.profileImg(a.getMymail()).lastIndexOf("\\")+1));
				wdatechange = a.getWdate();
				wdatechangemm = wdatechange.substring(5, 7); //월
				if((wdatechangemm.substring(0,1)).equals("0")) {
					wdatechangemm = wdatechangemm.substring(1,2);
				}
				wdatechangedd = wdatechange.substring(8, 10); //일
				wdatechangett = wdatechangemm+"월 "+wdatechangedd+"일";
				a.setWdate(wdatechangett);
			}
			inputArray.setFnames(ddao.timgoutput(inputArray));
			inputArray.setReply(FN);
			inputArray.setLikecnt(ddao.likeBaseCnt(inputArray));
			inputArray.setMymail(diary.getMymail());
			inputArray.setMyclickcheck(ddao.likecheck2(inputArray));
			inputArray.setMytagstate(ddao.mytagstate(inputArray));
		}
		return timeline;
	}
	
	public void reflectinsert(Reflect reflect) {
		ddao.reflectinsert(reflect);
	}
	public Reflect reflectview(Reflect ref) {
		return ddao.reflectview(ref);
	}
	
	
	@Value("${upload}")
	private String repos;
	private void upload(MultipartFile[] reports,ArrayList<TimelineFileVO> agofile) {
		String fileName="";
		String fileName2="";
		File f = null;
		File f2 = null;
		String imgtype = "";
		String beforeFileName ="";
		try {
			for(int idx=0, len=reports.length; idx<len; idx++) {
				beforeFileName = reports[idx].getOriginalFilename();
				fileName=repos+agofile.get(idx).getImgname();
				fileName2="C:/a01_java/workspace2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ppaeruwa/filefolder/"+agofile.get(idx).getImgname();
				f = new File(fileName);
				f2 = new File(fileName2);
				reports[idx].transferTo(f2);
				Files.copy(f2.toPath(),f.toPath());
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void replyinput(Reply reply) {
		ddao.replyinput(reply);
	}
	
	public ArrayList<Reply> replyoutput(Reply reply) {
		ArrayList<Reply> nicknamesetting = ddao.replyoutput(reply);
		String wdatechange = "";
		String wdatechangemm ="";
		String wdatechangedd ="";
		String wdatechangett ="";
		for(Reply a: nicknamesetting) {
			a.setNickname(ddao2.findNick(a.getMymail()));
			a.setProfile((ddao2.profileImg(a.getMymail())).substring(ddao2.profileImg(a.getMymail()).lastIndexOf("\\")+1));
			wdatechange = a.getWdate();
			wdatechangemm = wdatechange.substring(5, 7); //월
			if((wdatechangemm.substring(0,1)).equals("0")) {
				wdatechangemm = wdatechangemm.substring(1,2);
			}
			wdatechangedd = wdatechange.substring(8, 10); //일
			wdatechangett = wdatechangemm+"월 "+wdatechangedd+"일";
			a.setWdate(wdatechangett);
		}
		return nicknamesetting;
	}
	
	public int likecheck(Like like) {
		
		//일단 글번호를 넣고 있는지 이미 데이터가 있는지 여부를 체크하는 모듈
		//select로 글번호와 작성자 이메일 두개 파라미터로 여부 체크.
		if(ddao.likecheck(like)==0){
			//여부를 체크해서 좋아요 기록이 없을때 likecnt을 1추가(insert로 데이터 입력)메서드 실행
			ddao.likecntup(like);
		}else{
			//여부를 체크해서 좋아요를 클릭한 기록이 있을 때 likecnt를 1내리는(mymail,no 두개의 키값으로 조회된 데이터 삭제) 메서드 실행
			ddao.likecntdown(like);
		}
		return ddao.likeAllCnt(like);
	}
	public int mylikecheck(Like like) {
		return ddao.likecheck(like);
	}
	
	//타임라인 수정하기
	public Diary linemodify(int timelineno) {
		
		return ddao.linemodify(timelineno);
	}
	//타임라인 수정등록
	public void modinsert(Diary diary) {
		ddao.modinsert(diary);
	}
	//타임라이 삭제처리
	public void linedelete(int timelineno) {
		ddao.linedelete(timelineno);
		ddao.tagalldel(timelineno);
	}
	
	//팔로잉(Ajax)
	public int following(Follow follow) {
		if(ddao.following(follow)==0) {
			//팔로잉 하기(입력)
			ddao.followinginsert(follow);
		}else {
			ddao.followingdelete(follow);
		}
		//내가 팔로잉신청 했는지 조회
		return ddao.following(follow);
	}
	//팔로잉(초기화면)
	public int following2(Follow follow) {
		return ddao.following(follow);
	}
	public ArrayList<Member> followinglist(Follow follow){
//		ArrayList<Member> m = new ArrayList<Member>();
//		for(Follow e: ddao.followinglist(follow)) {
//			m.add(ddao2.userline(e.getFollowing()));
//		}
//		return m;
//	}
		ArrayList<Member> m = new ArrayList<Member>();
		Member mem = new Member();
		String userprofile = "";
		String userprofile2 = "";
		ArrayList<Follow> flist =  ddao.followinglist(follow);
		for(Follow e: flist) {
			mem = ddao2.userline(e.getFollowing());
			userprofile = (mem).getProfile();
			userprofile2 = userprofile.substring(userprofile.lastIndexOf("\\")+1);
			System.out.println("프로필사진이름"+userprofile2);
			mem.setProfile(userprofile2);
			m.add(mem);
		}
		return m;
	}
	public ArrayList<Member> followerlist(Follow follow){
		ArrayList<Member> m = new ArrayList<Member>();
		Member mem = new Member();
		String userprofile = "";
		String userprofile2 = "";
		ArrayList<Follow> flist =  ddao.followerlist(follow);
		for(Follow e: flist) {
			mem = ddao2.userline(e.getFollower());
			userprofile = (mem).getProfile();
			userprofile2 = userprofile.substring(userprofile.lastIndexOf("\\")+1);
			System.out.println("프로필사진이름"+userprofile2);
			mem.setProfile(userprofile2);
			m.add(mem);
		}
		return m;
	}
	public int followinglistcnt(String email){
		System.out.println(ddao.followinglistcnt(email));
		return ddao.followinglistcnt(email);
	}
	public int followerlistcnt(String email){
		return ddao.followerlistcnt(email);
	}
	public void followingdelete(Follow follow) {
		ddao.followingdelete(follow);
	}
	
	public void replydel(int refno) {
		ddao.replydel(refno);
	}
	public void tagadd(Diary diary) {
		ddao.tagadd(diary);
	}
	public void tagdel(Diary diary) {
		ddao.tagdel(diary);
	}
	public ArrayList<Diary> taglist(String email){
		ArrayList<Diary> taglist = ddao.taglist(email); 
		for(Diary e:taglist) {
			e.setFnames(ddao.timgoutput(e));
			String pin = (e.getProfile()).substring(e.getProfile().lastIndexOf("\\")+1);
			e.setProfile(pin);
		}
		return taglist;
	}
}
