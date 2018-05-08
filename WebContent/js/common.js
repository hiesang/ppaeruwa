$(document).ready(function(){
	$(".button-collapse").sideNav();
	
	var curr_top_title = $(".top-title");
	var locaionHref = $(location).attr("href");
	console.log(locaionHref);
	if(locaionHref.indexOf("main") > -1){
		curr_top_title.html("PPAERUWA");
	}else if(locaionHref.indexOf("signup") > -1){
		curr_top_title.html("회원가입");	
	}else if(locaionHref.indexOf("login") > -1){
		curr_top_title.html("로그인");
	}else if(locaionHref.indexOf("idfind") > -1){
		curr_top_title.html("아이디 찾기");
	}else if(locaionHref.indexOf("pwfind") > -1){
		curr_top_title.html("비밀번호 찾기");
	}else if(locaionHref.indexOf("member.do") > -1){
		locaionHref = $(location).attr("href");
		if(locaionHref.indexOf("findpw") > -1){
			curr_top_title.html("비밀번호 찾기");
		}
	}else if(locaionHref.indexOf("eat") > -1){
		curr_top_title.html("오늘의 식단");
	}else if(locaionHref.indexOf("sport") > -1){
		curr_top_title.html("오늘의 운동");
		if(locaionHref.indexOf("fitReviewList") > -1){
			curr_top_title.html("운동갈래");
		}
	}else if(locaionHref.indexOf("diary") > -1){
		curr_top_title.html("오늘의 일기");
	}else if(locaionHref.indexOf("report.jsp") > -1){
		curr_top_title.html("리포트");
	}else if(locaionHref.indexOf("report") > -1){
		curr_top_title.html("리포트");
	}else if(locaionHref.indexOf("weight.jsp") > -1){
		curr_top_title.html("체중기록");
	}else if(locaionHref.indexOf("weight.do") > -1){
		curr_top_title.html("체중기록");
	}else if(locaionHref.indexOf("recipe_total") > -1){
		curr_top_title.html("레시피");
	}else if(locaionHref.indexOf("mypage") > -1){
		curr_top_title.html("마이페이지");
	}else if(locaionHref.indexOf("timeline.do?method=list") > -1){
		curr_top_title.html("나의 타임라인");
	}else if(locaionHref.indexOf("timeline.do?method=userline") > -1){
		curr_top_title.html("타임라인");
	}else if(locaionHref.indexOf("timeline.do?method=modify") > -1){
		curr_top_title.html("일기 수정");
	}else if(locaionHref.indexOf("searchMem") > -1){
		curr_top_title.html("회원검색");
	}else if(locaionHref.indexOf("go_write") > -1){
		curr_top_title.html("운동갈래");
	}else if(locaionHref.indexOf("method=followerlist") > -1){
		curr_top_title.html("팔로워 리스트");
	}else if(locaionHref.indexOf("method=followinglist") > -1){
		curr_top_title.html("팔로잉 리스트");
	}else if(locaionHref.indexOf("show_recope") > -1){
		curr_top_title.html("레시피 뷰");
	}else if(locaionHref.indexOf("taglist") > -1){
		curr_top_title.html("내 태그 목록");
	}else if(locaionHref.indexOf("chatting") > -1){
		curr_top_title.html("채팅");
	}else if(locaionHref.indexOf("Plyer") > -1){
		curr_top_title.html("다이어트 영상");
	}
});