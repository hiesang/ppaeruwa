package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.service.MemberService;
import mvc.service.TimelineService;
import mvc.vo.Diary;
import mvc.vo.Follow;
import mvc.vo.Like;
import mvc.vo.Member;
import mvc.vo.Mystate;
import mvc.vo.Reflect;
import mvc.vo.Reply;

@Controller
@RequestMapping("/timeline.do")
public class TimelineCtrl {
	@Autowired(required=false)
	private TimelineService service;
	
	@Autowired(required=false)
	private MemberService memberService;
	
	@RequestMapping(params="method=stateinsert")
	public String stateinsert(Mystate state) {
		service.stateinsert(state);
		return "redirect:/timeline.do?method=list";
	}
	
//	http://localhost:7080/ppaeruwa/timeline.do?method=dinsert
	@RequestMapping(params="method=dinsert")
	public String diaryinsert(Diary diary) {
		service.diaryinsert(diary);
		return "redirect:/timeline.do?method=list";
	}
	
	@RequestMapping(params="method=rinsert")
	public String reflectinsert(Reflect reflect) {
		service.reflectinsert(reflect);
		return "redirect:/main.do?method=main";
	}
	
//	http://localhost:7080/ppaeruwa/timeline.do?method=list
	@RequestMapping(params="method=list")
	public String timelinelist(Diary diary, HttpSession session, Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		diary.setEmail(a);
		diary.setMymail(a);
		String b = (String)(((Member)session.getAttribute("member")).getNickname());
		d.addAttribute("timeline", service.timelinelist(diary));
		d.addAttribute("owner", a);
		d.addAttribute("nick", b);
		
		d.addAttribute("mystate", service.basestate(a));
		
		//팔로잉 초기 수
		d.addAttribute("followinglistcnt", service.followinglistcnt(a));
		d.addAttribute("followerlistcnt", service.followerlistcnt(a));
		
		String filePath = memberService.profileImg(a);
		String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		d.addAttribute("ownerprofile", fileName);
		return "timeline/timeline";
	}
	
//http://localhost:7080/ppaeruwa/member.do?method=userline
	@RequestMapping(params="method=userline")
	public String userline(Diary diary, @RequestParam("email")String owner, HttpSession session, Model d) {
		Member userline = memberService.userline(owner);
		d.addAttribute("userline", userline);
		
		
		Diary di = diary;
		di.setEmail(owner);
		
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		di.setMymail(a);
		
		d.addAttribute("owner", owner);
		d.addAttribute("timeline", service.timelinelist(di));
		d.addAttribute("nick", userline.getNickname());
		d.addAttribute("mystate", service.basestate(owner));
		
		
		d.addAttribute("fc", service.following2(new Follow(a, owner)));
		
		//팔로잉 초기 수
		d.addAttribute("followinglistcnt", service.followinglistcnt(owner));
		d.addAttribute("followerlistcnt", service.followerlistcnt(owner));
		
		
		
		String filePath = memberService.profileImg(owner);
		String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		d.addAttribute("ownerprofile", fileName);
		return "timeline/timeline";
	}
	
	@RequestMapping(params="method=replyinput")
	public String replyinput(Reply reply, Model d) {
		service.replyinput(reply);
		d.addAttribute("replist", service.replyoutput(reply));
		return "pageJsonReport";
	}
	@RequestMapping(params="method=refnodel")
	@ResponseBody
	public void refnodel(int refno) {
		System.out.println(refno+"들왔다 나가는중");
		service.replydel(refno);
	}
	
	
	@RequestMapping(params="method=like")
	@ResponseBody
	public String likeup(Like like) {
		String bodyvalue = Integer.toString(service.likecheck(like))+"_"+Integer.toString(service.mylikecheck(like));
		return bodyvalue;
	}
	@RequestMapping(params="method=modify")
	public String linemodify(@RequestParam("timelineno")int timelineno, Model d) {
		d.addAttribute("diarymod", service.linemodify(timelineno));
		return "no/diarymodify";
	}
	@RequestMapping(params="method=modinsert")
	public String modinsert(Diary diary) {
		service.modinsert(diary);
		return "redirect:/timeline.do?method=list";
	}
	@RequestMapping(params="method=delete")
	public String linedelete(@RequestParam("timelineno")int timelineno) {
		service.linedelete(timelineno);
		return "redirect:/timeline.do?method=list";
	}
	@RequestMapping(params="method=follow")
	@ResponseBody
	public String follow(Follow follow, Model d) {
		String fc = Integer.toString(service.following(follow))+"_"+Integer.toString(service.followinglistcnt(follow.getFollowing()));
//		d.addAttribute("followcheck", service.following(follow));
		return fc;
	}
	
	@RequestMapping(params="method=followinglist")
	public String followinglist(Follow follow, Model d) {
		d.addAttribute("self", follow.getFollower());
		d.addAttribute("fl", service.followinglist(follow));
		d.addAttribute("pagemethod", "followinglist");
		return "timeline/followinglist";
	}
	@RequestMapping(params="method=followerlist")
	public String followerlist(Follow follow, Model d) {
		d.addAttribute("self", follow.getFollower());
		d.addAttribute("fl", service.followerlist(follow));
		return "timeline/followinglist";
	}
	@RequestMapping(params="method=followingdelete")
	@ResponseBody
	public void followingdelete(Follow follow) {
		service.followingdelete(follow);
	}
	@RequestMapping(params="method=tagadd")
	@ResponseBody
	public void tagadd(Diary diary) {
		service.tagadd(diary);
	}
	@RequestMapping(params="method=tagdel")
	@ResponseBody
	public void tagdel(Diary diary) {
		service.tagdel(diary);
	}
	@RequestMapping(params="method=taglist")
	public String taglist(Diary diary, HttpSession session, Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		d.addAttribute("taglist", service.taglist(a));
		return "timeline/taglist";
	}
	
}
