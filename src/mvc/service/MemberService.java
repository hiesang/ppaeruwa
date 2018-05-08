package mvc.service;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mvc.repository.MemberDAO;
import mvc.vo.Member;

@Service
public class MemberService {
	@Autowired(required=false)
	private MemberDAO memberDao;
	
	public void memberInsert(Member member) {
		memberDao.memberInsert(member);
	}
	
	public String emailConfirm(String email) {
		if(memberDao.emailConfirm(email) == 1) {
			return "사용 중인 아이디입니다.";
		}
		return "사용 가능한 아이디입니다.";
	}
	
	public Member login(Member member) {
		return memberDao.login(member);
	}
	
	public Member findId(Member member) {
		return memberDao.findId(member);
	}
	
	public Member findPw(Member member) {
		return memberDao.findPw(member);
	}
	
	public String profileImg(String email) {
		return memberDao.profileImg(email);
	}
	
	public String searchMem(String search) {
		ArrayList<Member> list = memberDao.searchMem(search);
		JSONObject obj = null;
		JSONArray jarray = new JSONArray();
		for(Member mem:list) {
			obj = new JSONObject();
			obj.put("email", mem.getEmail());
			obj.put("nickname", mem.getNickname());
			obj.put("name", mem.getName());
			jarray.add(obj);
		}
		
		return jarray.toString();
	}
	
	@Value("${upload}")
	private String repos;
	public String profileUpdate(MultipartHttpServletRequest multi, String email) {
		// System.out.println("이메일: " + email);
		
		// 저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root: " + root);
		
		// WebContent 경로
		String path = repos;
		File cpFile = null;
		// System.out.println("path: " + path);
		
		// 업로드 되는 파일명
		String newFileName = "";
		
		File dir = new File(path);
		// 해당 경로에서 디렉토리가 존재하는지 확인
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		Iterator<String> files = multi.getFileNames();
		String fileName = "";
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mFile = multi.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();
			// System.out.println("실제 파일 이름:" + fileName);
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			
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
				memberDao.profileUpdate(email, cpFile.toPath().toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return cpFile.toPath().toString();
	}
	
	public void memberUpdate(Member member) {
		memberDao.memberUpdate(member);
	}
	
	public ArrayList<Member> userlist() {
		return memberDao.userlist();
	}
	
	public Member userline(String email) {
		return memberDao.userline(email);
	}
	
}
