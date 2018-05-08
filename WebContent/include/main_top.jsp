<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- top -->
<script>
function logout(){
	if(confirm("로그아웃 하시겠습니까?")){
		location.href = '${path}/member/logout.jsp';
	}
}
</script>
<div id="top">
	<div class="container">
		<div class="row">
			<div class="col s12">
				<ul id="slide-out" class="side-nav">
			    	<li>
			    		<div class="user-view">
			      			<div class="background"></div>
			      			<div class="account-icon">
			      				<i class="material-icons large">account_circle</i>
			      			</div>
			      			<a href="#!name"><span class="white-text name">${member.nickname}</span></a>
			      			<a href="javascript:logout()"><span click="logout()" class="white-text email">${member.email} &nbsp;&nbsp;<span>로그아웃</span></span></a>
			    		</div>
			    	</li>
			    	<li><a href="${path}/timeline.do?method=list">타임라인</a></li>
			    	<li><a href="${path}/eat.do?method=list">오늘의 식단</a></li>
			    	<li><a href="${path}/sport.do?method=list">오늘의 운동</a></li>
			    	<li><a href="${path}/no/diary.jsp">오늘의 일기</a></li>
			    	<li><a href="${path}/report/report.jsp">리포트</a></li>
			    	<li><a href="${path}/report/weight.jsp">체중 기록</a></li>
			    	<li><a href="${path}/sport.do?method=fitReviewList">운동 갈래</a></li>
			    	<li><a href="${path}/Plyer.do?method=list">다이어트 영상</a></li>
			    	<li><a href="${path}/recipe/recipe_total.jsp">레시피</a></li>
			    	<li><a href="${path}/no/mypage.jsp">마이페이지</a></li>
			    	<li><a href="${path}/timeline.do?method=taglist">태그목록</a></li>
			    	<li><a href="${path}/member/searchMem.jsp">친구찾기</a></li>
			  	</ul>
			  	<div class="top-area clearfix">
			  		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons mmBtn-icon">menu</i></a>
			  		<div class="top-title"></div>
			  	</div>
			</div>
		</div>
	</div>
</div>
<!-- top -->