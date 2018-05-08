package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.service.TimelineService;
import mvc.vo.Member;
import mvc.vo.Reflect;

@Controller
@RequestMapping("/main.do")
public class Mainpage {
	@Autowired(required=false)
	private TimelineService service;
	
	
	@RequestMapping(params="method=main")
	public String mainpage(HttpSession session,Model d) {
		if(session.getAttribute("member")!=null && !session.getAttribute("member").equals("")) {
			String a = (String)(((Member)session.getAttribute("member")).getEmail());
			Reflect ref = new Reflect();
			ref.setEmail(a);
			d.addAttribute("reflect", service.reflectview(ref));
		}
			return "main/main";
	}
}
