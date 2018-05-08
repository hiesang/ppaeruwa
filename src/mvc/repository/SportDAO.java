package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.GoFitness;
import mvc.vo.Sport;
import mvc.vo.Tosport;

@Repository
public interface SportDAO {
	public ArrayList<Sport> searchSport(String sch);
	public void Sportinsert(Tosport tosport);
	public ArrayList<Tosport>Tosportlist(Tosport tosport);
	public ArrayList<Tosport>TTlist(Tosport tosport);
	public void delSport(Tosport tosport);
	
	// 운동갈래(후기)
	public void fitReviewInsert(GoFitness gofitness);
	public ArrayList<GoFitness> fitReviewList();
}
