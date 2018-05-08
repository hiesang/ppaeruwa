package mvc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.repository.ReportDAO;
import mvc.vo.Useeat;

@Service
public class ReportService {

	@Autowired(required=false)
	private ReportDAO tdao;
	
	public ArrayList<Useeat> reportlist(Useeat useeat){
		return tdao.reportlist(useeat);
	}

}
