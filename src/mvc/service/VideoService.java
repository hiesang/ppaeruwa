package mvc.service;


import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mvc.repository.VideoDAO;
import mvc.vo.VideoSch;
import mvc.vo.Videoply;

@Service
public class VideoService {
	@Autowired(required=false)
	private VideoDAO dao;
	
	
	public ArrayList<Videoply> play_list(VideoSch sch){ // 전체 리스트
		System.out.println("넘어간다");
		return dao.play_list(sch);
	}
	
	public Videoply show_play(VideoSch list){ // 상세페이지
		return dao.show_play(list);
	}
	public ArrayList<Videoply> show_list(VideoSch list){ // 상세 페이지 리스트
		return dao.show_list(list);
	}
	
	@Value("${upload}")
	private String repos;
	public void upload_video(String email,String nickname,String title,
						String explan,MultipartHttpServletRequest multi,String linker) {
		String root = multi.getSession().getServletContext().getRealPath("/");
		
		String path = repos;
		File cpFile = null;
		
		String newFilename = "";
		File dir = new File(path);
		
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files= multi.getFileNames();
		String fileName="";
		while(files.hasNext()) {
			String upload_video = files.next();
			
			MultipartFile mFile = multi.getFile(upload_video);
			fileName = mFile.getOriginalFilename();
			newFilename = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".") + 1);
			
			try {
				String path01 = "C:/a01_java/workspace2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ppaeruwa/filefolder/";
				File tmpFile = new File(path01 + fileName);
				mFile.transferTo(tmpFile);
				cpFile = new File(repos + "/" + fileName);
				
				File existFile = new File(cpFile.toPath().toString());
				boolean existFileResult = existFile.exists();
				// System.out.println(existFileResult);
				
				if(!existFileResult) {
					Files.copy(tmpFile.toPath(), cpFile.toPath());
				}
				
				// System.out.println(tmpFile.toPath().toString());
				dao.upload_video(email,nickname,title,explan,fileName,linker);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}

