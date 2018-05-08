package mvc.controller;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mvc.service.MailService;
import mvc.service.MemberService;
import mvc.vo.Member;

@Controller
@RequestMapping("/member.do")
public class MemberCtrl {
	@Autowired(required=false)
	private MemberService memberService;
	
	@Autowired(required=false)
	private MailService mailService;
	
	// 회원가입
	// http:localhost:7080/ppaeruwa/member.do?method=insert
	@RequestMapping(params="method=insert")
	public String memberInsert(Member member, HttpSession session) {
		memberService.memberInsert(member);
		session.setAttribute("member", member);
		session.setAttribute("profile", member.getProfile());
		return "redirect:/main/main.jsp";
	}
		
	// 이메일 중복 체크
	// http:localhost:7080/ppaeruwa/member.do?method=duConfirm
	@RequestMapping(params="method=duConfirm")
	@ResponseBody
	public String emailConfirm(@RequestParam("email") String email) {
		System.out.println(UUID.randomUUID().toString().substring(0, 7));
		memberService.emailConfirm(email);
		
		return memberService.emailConfirm(email);
	}
	
	// 이메일 인증 메일 전송
	// http:localhost:7080/ppaeruwa/member.do?method=checkUser
	@RequestMapping(params="method=checkUser")
	@ResponseBody
	public String checkUserEmail(@RequestParam("email") String email) throws Exception {
		String uuid = mailService.checkUserEmail(email);
		return uuid;
	}
	
	// 로그인
	// http:localhost:7080/ppaeruwa/member.do?method=login
	@RequestMapping(params="method=login")
	@ResponseBody
	public String login(Member member, HttpSession session) {
		Member login = memberService.login(member);
		if(login == null) {
			return "이메일 또는 비밀번호를 다시 확인해주세요.";
		}
		session.setAttribute("member", login);
		String filePath = login.getProfile();
		String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		session.setAttribute("profile", fileName);
		return "로그인 성공입니다.";
	}
	
	// 아이디 찾기
	// http:localhost:7080/ppaeruwa/member.do?method=findid
	@RequestMapping(params="method=findid")
	public String findId(Member member, Model model) {
		Member findUser = memberService.findId(member);
		if(findUser == null) {
			model.addAttribute("userId", "");
		}else {
			model.addAttribute("userId", memberService.findId(member).getEmail());
		}
			
		return "member/idfindPopup";
	}
	
	// 비밀번호 찾기(비밀번호 메일 전송)
	// http:localhost:7080/ppaeruwa/member.do?method=findpw
	@RequestMapping(params="method=findpw")
	public String findPw(Member member, Model model) throws Exception {
		Member userFindPw = memberService.findPw(member);
		if(userFindPw == null) {
			model.addAttribute("mailSend01", "회원님의 정보가 존재하지 않습니다. 다시 확인해주세요.");
		}else {
			mailService.sendMail(userFindPw);
			model.addAttribute("mailSend02", "회원님의 이메일 주소로 비밀번호를 전송하였습니다.");
		}
		return "member/pwfind";
	}
	
	// 회원검색
	@RequestMapping(params="method=search")
	@ResponseBody
	public String searchMem(@RequestParam("search") String search) {
		return memberService.searchMem(search);
	}
	
	// 회원정보 수정하기
	@RequestMapping(params="method=update")
	public String memberUpdate(Member member, HttpSession session) {
		memberService.memberUpdate(member);
		session.setAttribute("member", memberService.login(member));
		return "no/mypage";
	}
	
	// 멤버 리스트
	@RequestMapping(params="method=userlist")
	public String userlist(Model d) {
		ArrayList<Member> userlist = memberService.userlist();
		d.addAttribute("userlist", userlist);
		return "timeline/userlist";
	}
	
	// 프로필 사진 가져오기
	/*@RequestMapping(params="method=profileImg")
	public String profileImg(@RequestParam("email") String email, HttpSession session) {
		String filePath = memberService.profileImg(email);
		String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		session.setAttribute("profile", fileName);
		return "no/mypage";
	}*/
	
	// 프로필 사진 수정하기
	@RequestMapping(params="method=profileUpdate")
	public String profileUpdate(MultipartHttpServletRequest multi, @RequestParam("email") String email, HttpSession session) {
		String filePath = memberService.profileUpdate(multi, email);
		String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		session.setAttribute("profile", fileName);
		return "no/mypage";
	}
	
}
