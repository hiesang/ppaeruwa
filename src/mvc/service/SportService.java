package mvc.service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.repository.SportDAO;
import mvc.vo.GoFitness;
import mvc.vo.Sport;
import mvc.vo.Tosport;

@Service
public class SportService {
	@Autowired(required=false)
	private SportDAO spdao;
	
	public String searchSport(String sch){
		ArrayList<Sport> list = spdao.searchSport(sch);
		JSONObject obj = null;
		JSONArray jarry = new JSONArray();
		for(Sport sport:list) {
			obj = new JSONObject();
			obj.put("sports", sport.getSports());
			obj.put("mets", sport.getMets());
			jarry.add(obj);
		}
		
		return jarry.toString();
	}
	public void Sportinsert(Tosport tosport) {
		spdao.Sportinsert(tosport);
	}
	public ArrayList<Tosport>Tosportlist (Tosport email){
		return spdao.Tosportlist(email);
	}
	public ArrayList<Tosport>TTlist(Tosport tosport){
		return spdao.TTlist(tosport);
	}
	
	public void delSport(Tosport tosport) {
		spdao.delSport(tosport);
	}
	
	// 운동갈래(후기작성)
	public void fitReviewInsert(GoFitness gofitness) {
		spdao.fitReviewInsert(gofitness);
	}
	
	// 운동갈래(후기리스트)
	public ArrayList<GoFitness> fitReviewList(){
		ArrayList<GoFitness> list = spdao.fitReviewList();
		ArrayList<GoFitness> reviewValList = new ArrayList<GoFitness>();
		GoFitness reviewVo = null;
		for(GoFitness review:list) {
			reviewVo = new GoFitness();
			reviewVo.setBbsid(review.getBbsid());
			reviewVo.setEmail(review.getEmail());
			reviewVo.setNickname(review.getNickname());
			reviewVo.setSearch(review.getSearch());
			reviewVo.setLatitude(review.getLatitude());
			reviewVo.setLongitude(review.getLongitude());
			reviewVo.setContent(review.getContent());
			reviewVo.setCurrdate(review.getCurrdate());
			reviewValList.add(reviewVo);
		}
		return reviewValList;
	}
}
