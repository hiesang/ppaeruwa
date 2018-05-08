package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.FoodList;
import mvc.vo.Useeat;

@Repository
public interface FoodDAO {
	public ArrayList<FoodList> searchFood(String sch);
	public void Eatinsert(Useeat useeat);
	public ArrayList<Useeat> eatlist(Useeat use); // 현재
	public ArrayList<Useeat> clist(Useeat useeat); // 선택 날짜
	public void eatdelete(Useeat useeat);
}
