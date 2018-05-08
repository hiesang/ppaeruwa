package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mvc.service.VideoService;
import mvc.vo.VideoSch;
import mvc.vo.Videoply;

@Controller
@RequestMapping("Plyer.do")
public class VideoCtrl {
	@Autowired(required=false)
	private VideoService service;
	
	// Plyer.do?method=list
	@RequestMapping(params="method=list") // 전체 리스트겸 검색
	public String play_list(@ModelAttribute("sch")VideoSch sch,Model d) {
		System.out.println("테스트1");
		d.addAttribute("list",service.play_list(sch));
		return "player/playlist";
	}
	// Plyer.do?method=showlist
	@RequestMapping(params="method=showlist") // 상세화면 
	public String show_play(@ModelAttribute("list")VideoSch list,Model d) {
		System.out.println("테스트2");
		d.addAttribute("show", service.show_play(list));
		d.addAttribute("clist", service.show_list(list));
		return "player/show_play";
	}
	/*@RequestMapping(params="method=showlist") // 상세화면 리스트
	public String show_list(Videoply list,Model d) {
		System.out.println("리스트2");
		
		return "player/show_play";
	}*/

	// Plyer.do?method=insForm
	@RequestMapping(params="method=insForm")
	public String form() {
		return "player/upload_player";
	}
	@RequestMapping(params="method=upload") // 파일 업로드
	public String uploadvideo(@RequestParam("email")String email,@RequestParam("nickname")String nickname,@RequestParam("title")String title,
							@RequestParam("explan")String explan,MultipartHttpServletRequest multi,@RequestParam("linker")String linker) {
		service.upload_video(email, nickname, title, explan, multi, linker);
		System.out.println(title);
		return "redirect:/Plyer.do?method=list";
	}
	
}
