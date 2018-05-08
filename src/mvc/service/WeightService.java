package mvc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.repository.WeightDAO;
import mvc.vo.Diary;
import mvc.vo.Weight;
import mvc.vo.Member;
@Service
public class WeightService {
	@Autowired(required=false)
	private WeightDAO wdao;
	
	public void weightinsert(Weight weight) {
		wdao.weightinsert(weight);
	}
	public void weightupdate(Member member) {
		wdao.weightupdate(member);
	}
	public ArrayList<Weight> weightlist(Weight weight) {
		return wdao.weightlist(weight);
	}
	
	public void del(Weight weight) {
		wdao.del(weight);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
