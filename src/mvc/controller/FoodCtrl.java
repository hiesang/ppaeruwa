package mvc.controller;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.service.FoodService;
import mvc.vo.Member;
import mvc.vo.Useeat;

@Controller
@RequestMapping("/eat.do")
public class FoodCtrl {
	@Autowired(required=false)
	private FoodService service;
	
	
	/*String eatlist(Useeat use,HttpSession session ,Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		use.setEmail(a); 
		d.addAttribute("list",service.eatlist(use));*/
	// /eat.do?method=list
	@RequestMapping(params="method=list")
	public String eatlist(Useeat use,HttpSession session ,Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		use.setEmail(a); 
		d.addAttribute("list",service.eatlist(use));
		return "today/diet";
	}
	@RequestMapping(params="method=clist")
	public String clist(Useeat useeat,HttpSession session , Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		useeat.setEmail(a);
		d.addAttribute("clist", service.clist(useeat));
		return "pageJsonReport"; 
	}
	
	// /eat.do?method=sch
	@RequestMapping(params="method=sch")
	@ResponseBody
	public String foodlist(@RequestParam("sch")String sch) {
		return service.searchFood(sch); 
	}
	
	// /eat.do?method=insert
	@RequestMapping(params="method=insert")
	public String Eatinsert(Useeat useeat, Model d) {
		service.Eatinsert(useeat);
		System.out.println("전송");
		d.addAttribute("clist", service.clist(useeat));
		for(Useeat test : service.clist(useeat)) {
			System.out.println(test.getEmail());
			System.out.println(test.getTime());
		}
		return "pageJsonReport";
//		return "redirect:/eat.do?method=clist";
	}
	
	// /eat.do?method=delete
	@RequestMapping(params="method=delete")
	public String eatdelete(Useeat useeat, Model d) {
		service.eatdelete(useeat);
		System.out.println("삭제");
		d.addAttribute("clist", service.clist(useeat));
		System.out.println("삭제");
		return "pageJsonReport";
	}
}
