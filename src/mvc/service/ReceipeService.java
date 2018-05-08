package mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.repository.ReceipeDAO;
import mvc.vo.Receipe;
import mvc.vo.ReceipeFile;

@Service
public class ReceipeService {
	@Autowired(required=false)
	private ReceipeDAO rdao;
	
	public void rinsert(Receipe receipe) {
		rdao.rinsert(receipe);
		/*String beforeFileName = "";
		String imgtype = "";
		for(MultipartFile report:re.getReport()) {
			beforeFileName = report.getOriginalFilename();
		if(beforeFileName.endsWith(".jpg")) {
			imgtype = ".jpg";
		}else if(beforeFileName.endsWith(".png")) {
			imgtype=".png";
		}else if(beforeFileName.endsWith(".PNG")) {
			imgtype=".PNG";
		}
		rdao.reportInsert(re.getEmail(), imgtype);
		}*/
	}
	
	/*public void rinsert3(ReceipeFile rf) {
		rdao.rinsert3(rf);
		String beforeFileName = "";
		String imgtype = "";
	}*/
/*@Value("${upload2}")
private String rpos;
public void upload2(MultipartFile[] re,ArrayList<ReceipeFile> rfile) {
	String fileName="";
	File f = null;
	String imgtype = "";
	String beforeFileName = "";
	try {
		for(int idx=0, len=re.length; idx<len; idx++) {
			beforeFileName = re[idx].getOriginalFilename();
			fileName=rpos+rfile.get(idx).getImgname();
			f = new File(fileName);
			re[idx].transferTo(f);
		}
//		for(MultipartFile report:reports ) {
//			fileName=repos+report.getOriginalFilename();
//			f = new File(fileName);
//			report.transferTo(f);
//		}
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}*/
	
}
