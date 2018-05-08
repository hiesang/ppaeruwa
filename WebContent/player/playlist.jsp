<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.lately_p{
font-size: 5px;
color:#a8a6a6;
}

.some_shhow{
font-size: 11px;
}
.go_upload{
margin-left:10%;
display:inline-block;
}
</style>
<script>
$(document).ready(function(){
	$("input[name=sch]").keyup(function(){
		var init_sch = $(this).val();
		$("#in_1").val(init_sch);
		$("#in_2").val(init_sch);
		$("#in_3").val(init_sch);
	});
	$(".sch_submitbt").click(function(){
		var sch = $("input[name=sch]").val();
		if(sch != null && sch != ""){
			/* $("form.sch_form").attr("action","${path}/Plyer.do?method=list"); */
			$("form.sch_form").submit();
		}else{
			alert("검색조건이 없습니다");
			return false;
		}
	});
	
	$(".show_idx_").each(function(idx){
		$(this).click(function(){
			var title = $(".title_").eq(idx).val();
			var time = $(".time_").eq(idx).val();
			var sndData= $(".click_show").eq(idx).serialize();
			$(".click_show").eq(idx).attr("action",'${path}/Plyer.do?method=showlist');
			$(".click_show").eq(idx).submit();
		});
	});
});
</script>
<body>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents">
	<div class="logo_">
		<img src="player/logo.png" width="30%" height="25px;"/>
		<input type="text" name="sch" style="width:30%;margin:0;height:23px" value="${param.sch}"/>
				<input type="hidden" name="email" id="in_1" value="${param.email}"/>
				<input type="hidden" name="title" id="in_2" value="${param.title}"/>
				<input type="hidden" name="nickname" id="in_3" value="${param.nickname}"/>
				<button type="submit" class="sch_submitbt"><i class="tiny material-icons">zoom_in</i></button>
		<div class="go_upload">
		<a href="${path}/Plyer.do?method=insForm" ><i class="material-icons">cloud_upload</i></a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			
			<form class="sch_form" method="post">
			<div class="col s8">
				
			</div>
			</form>
			<br>
		</div>
		<c:forEach var="play" items="${list}">
		<form class="click_show" method="post">
		<div class="row show_idx_" style="margin-bottom:5px;">
		
		<input type="hidden" name="time" value="${play.time}" class="time_"/>
		<input type="hidden" name="title" value="${play.title}" class="title_"/>
			<div class="col s6">
				<video width="100%" height="86px">
					<source src="${path}/filefolder/${play.fname}" type="video/mp4">
				</video>
				<!-- <div style="border:1px solid black;width:100%;height:86px"></div> -->
			</div>
				<div class="col s5" style="padding:5px 0; height:90px">
				<div><strong>
					<c:choose> 
						<c:when test="${(play.title).length() > 14}">
						<c:set var="title" value="${(play.title).substring(0,13)}" />
						${title}...
						</c:when>
						<c:otherwise>
						${play.title}
						</c:otherwise>
					</c:choose>
					 </strong></div>
				
				<div class="some_shhow">
				<span>${play.nickname}님</span><Br>
				<span>조회수 ${play.shower}</span>
				</div>
				</div>	
		
		</div>
		</form>
		</c:forEach>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>