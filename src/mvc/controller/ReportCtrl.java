package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.service.ReportService;
import mvc.vo.Useeat;

@Controller
@RequestMapping("/report.do")
public class ReportCtrl {

	@Autowired(required=false)
	private ReportService ts;
	
	@RequestMapping(params="method=tlist")
	public String reportlist(Useeat useeat, Model d) {
		d.addAttribute("rtlist",ts.reportlist(useeat));
		
		return "report/report";
	}
	

}
