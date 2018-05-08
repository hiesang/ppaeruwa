package mvc.repository;

import org.springframework.stereotype.Repository;

import mvc.vo.Receipe;
import mvc.vo.ReceipeFile;

@Repository
public interface ReceipeDAO {
public void rinsert(Receipe receipe);
public void rinsert3(ReceipeFile rf);
public void reportInsert(String email,String imgtype);	
}
