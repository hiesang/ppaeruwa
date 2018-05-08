package mvc.repository;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.Diary;
import mvc.vo.Weight;
import mvc.vo.Member;

@Repository
public interface WeightDAO {
	public void weightinsert(Weight weight);
	public void weightupdate(Member member);
	public ArrayList<Weight> weightlist(Weight weight);
	public void del(Weight weight);
}
