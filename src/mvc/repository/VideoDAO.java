package mvc.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import mvc.vo.VideoSch;
import mvc.vo.Videoply;

@Repository
public interface VideoDAO {
	public void upload_video(String email,String nickname,
				String title,String explan,String fname,String linker);
	
/*	public int video_count(VideoSch sch);*/
	public ArrayList<Videoply> play_list(VideoSch sch); // 전체리스트 + 검색
	public Videoply show_play(VideoSch list); // 상세페이지
	public ArrayList<Videoply> show_list(VideoSch list);
}
