package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.service.ReceipeService;
import mvc.vo.Receipe;

@Controller
@RequestMapping("/receipe.do")
public class ReceipeCtrl {
	@Autowired(required=false)
	private ReceipeService rs;
	// http://localhost:7080/ppaeruwa/receipe.do?method=reinsert
	@RequestMapping(params="method=rinsert")
	public String rinsert(Receipe receipe) {
		rs.rinsert(receipe);
		return "recipe/recipe_up";
	}
	
}
