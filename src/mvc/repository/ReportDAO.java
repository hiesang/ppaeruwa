package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.Useeat;

@Repository
public interface ReportDAO {

	public ArrayList<Useeat> reportlist(Useeat useeat);

}
