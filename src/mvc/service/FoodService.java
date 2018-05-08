package mvc.service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.repository.FoodDAO;
import mvc.vo.FoodList;
import mvc.vo.Useeat;

@Service
public class FoodService {
	@Autowired(required=false)
	private FoodDAO dao;

	public String searchFood(String sch) {
		ArrayList<FoodList> list = dao.searchFood(sch);
		JSONObject obj = null;
		JSONArray jarry = new JSONArray();
		for(FoodList food:list) {
			obj = new JSONObject();
			obj.put("foodname", food.getFoodname());
			obj.put("oneeat", food.getOneeat());
			obj.put("kcal", food.getKcal());
			obj.put("carbohy", food.getCarbohy());
			obj.put("protein", food.getProtein());
			obj.put("fat", food.getFat());
			obj.put("natrium", food.getNatrium());
			jarry.add(obj);
		}
		return jarry.toString();
	}
	public void Eatinsert(Useeat useeat) {
		dao.Eatinsert(useeat);
	}
	public ArrayList<Useeat> eatlist (Useeat use){
		return dao.eatlist(use);
	}
	public ArrayList<Useeat> clist (Useeat useeat){
		return dao.clist(useeat);
	}
	public void eatdelete(Useeat useeat) {
		dao.eatdelete(useeat);
	}
	
}
