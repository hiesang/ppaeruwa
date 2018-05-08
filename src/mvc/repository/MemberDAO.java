package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import mvc.vo.Member;
import mvc.vo.Reply;

@Repository
public interface MemberDAO {
	public void memberInsert(Member member);
	public int emailConfirm(String email);
	public Member login(Member member);
	public Member findId(Member member);
	public Member findPw(Member member);
	public ArrayList<Member> searchMem(String search);
	public void memberUpdate(Member member);
	
	public ArrayList<Member> userlist();
	public Member userline(String email);
	public String findNick(String email);
	
	public String profileImg(String email);
	public void profileUpdate(String email, String profile);
	
}