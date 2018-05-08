package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.Diary;
import mvc.vo.Follow;
import mvc.vo.Like;
import mvc.vo.Mystate;
import mvc.vo.Reflect;
import mvc.vo.Reply;
import mvc.vo.TimelineFileVO;

@Repository
public interface DiaryDAO {
	public void diaryinsert(Diary diary);
	public void insertRepo(String email, String imgtype);
	public void reflectinsert(Reflect reflect);
	public Reflect reflectview(Reflect ref);
	
	public ArrayList<TimelineFileVO> timg(Diary diary);
	public ArrayList<TimelineFileVO> timgoutput(Diary diary);
	public ArrayList<Diary> timelinelist(Diary diary);
	public void replyinput(Reply reply);
	public ArrayList<Reply> replyoutput(Reply reply);
	public ArrayList<Reply> replyoutputAll(Diary diary);
	
	//일단 글번호를 넣고 있는지 이미 데이터가 있는지 여부를 체크하는 모듈
	//select로 글번호와 작성자 이메일 두개 파라미터로 여부 체크.
	public int likecheck(Like like);
	public int likecheck2(Diary diary);
	public void likecntup(Like like);
	public void likecntdown(Like like);
	public int likeAllCnt(Like like); //에이작스로 쓸때만 활용되는. (타임라인 페이지 열렸을때 바로 갯수 출력하도록 하는건 다른 메서드 필요)
	public int likeBaseCnt(Diary diary);
	
	//수정하기
	public Diary linemodify(int timelineno);
	//수정등록
	public void modinsert(Diary diary);
	//타임라인글(오늘의일기)삭제처리
	public void linedelete(int timelineno);
	//상태메시지
	public void stateinsert(Mystate state);
	//상태메시지
	public int mscheck(Mystate state);
	
	public void msmodify(Mystate state);
	
	public Mystate selectms(Mystate state);
	
	//팔로잉 하기(입력)
	public void followinginsert(Follow follow);
	//내가 팔로잉신청 했는지 조회
	public int following(Follow follow);
	//팔로잉 취소
	public void followingdelete(Follow follow);
	
	//팔로잉리스트
	public ArrayList<Follow> followinglist(Follow follow);
	//팔로워리스트
	public ArrayList<Follow> followerlist(Follow follow);
	
	//팔로잉 수
	public int followinglistcnt(String email);
	//팔로잉 수
	public int followerlistcnt(String email);
	
	public void replydel(int refno);
	public void tagadd(Diary diary);
	public void tagdel(Diary diary);
	public int mytagstate(Diary diary);
	public ArrayList<Diary> taglist(String email);
	public void tagalldel(int timelineno);
}
