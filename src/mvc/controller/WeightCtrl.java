package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import mvc.service.WeightService;
import mvc.vo.Weight;
import mvc.vo.Member;

@Controller
@RequestMapping("/weight.do")
public class WeightCtrl {
	
	@Autowired(required=false)
	private WeightService ws;
	

//	http://localhost:7080/ppaeruwa/weight.do?method=winsert
	@RequestMapping(params="method=winsert")
	public String weightinsert(Weight weight, Model d) {
		ws.weightinsert(weight);
		
		d.addAttribute("weilist", ws.weightlist(weight));
		
		
		return "report/weight";
	}
//	http://localhost:7080/ppaeruwa/weight.do?method=wlist
	@RequestMapping(params="method=wlist")
	public String weightlist(Weight weight, Model d) {
			d.addAttribute("weilist", ws.weightlist(weight));
			ws.del(weight);
			d.addAttribute("weilist", ws.weightlist(weight));
		return "report/weight";
	}
//	http://localhost:7080/ppaeruwa/weight.do?method=wupdate
	@RequestMapping(params="method=wupdate")
	public String weightupdate(Member member) {
		ws.weightupdate(member);
		return "report/weight";
		
	}
	
	@RequestMapping(params="method=del")
	public String del(Weight weight) {
		
		return "report/weight.do?method=winsert";
		
	}
}
