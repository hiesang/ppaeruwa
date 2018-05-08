package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.service.SportService;
import mvc.vo.GoFitness;
import mvc.vo.Member;
import mvc.vo.Tosport;


@Controller
@RequestMapping("/sport.do")
public class SportCtrl {
	@Autowired(required=false)
	private SportService service;
	
	// http://localhost:7080/ppaeruwa/sport.do?method=list
	@RequestMapping(params="method=list")
	public String Tosportlist(Tosport email,HttpSession session, Model d) {
		String a = (String)(((Member)session.getAttribute("member")).getEmail());
		email.setEmail(a);
		d.addAttribute("list", service.Tosportlist(email));
		return "today/fitness";
	}
	
	@RequestMapping(params="method=clist")
	public String TTlist(Tosport tosport,Model d) {
		d.addAttribute("clist", service.TTlist(tosport));
		return "pageJsonReport";
	}
	
	// /sport.do?method=sch
	@ResponseBody
	@RequestMapping(params="method=sch")
	public String searchSport(@RequestParam("sch")String sch) {
		return service.searchSport(sch); 
	}
	
	// /sport.do?method=insert 
	@RequestMapping(params="method=insert")
	public String Sportinsert(Tosport tosport,Model d) {
		System.out.println("전송");
		service.Sportinsert(tosport);
		d.addAttribute("clist", service.TTlist(tosport));
		return "pageJsonReport";
	}
	// /sport.do?method=delete
	@RequestMapping(params="method=delete")
	public String delSport(Tosport tosport,Model d) {
		service.delSport(tosport);
		System.out.println("삭제");
		d.addAttribute("clist", service.TTlist(tosport));
		return "pageJsonReport";
	}
	
	// 운동갈래 후기 작성
	@RequestMapping(params="method=fitReviewInsert")
	public String fitReviewInsert(GoFitness gofitness) {
		service.fitReviewInsert(gofitness);
		return "no/go_write";
	}
		
	// 운동갈래 후기 리스트
	@RequestMapping(params="method=fitReviewList")
	public String fitReviewList(Model model) {
		model.addAttribute("review", service.fitReviewList());
		return "no/go";
	}
	
}
