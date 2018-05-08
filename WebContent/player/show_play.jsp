<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.linker_bt{
float:right;
background-color:#f00;
color:white;
border-radius: 5px;
font-size:12px;
padding:2px 5px;
}
.title_left{
float:left;
width: 90%;
padding-right:15px;
min-height:29px;
}
.i_right{
float:right;
}
.explan_here{
border-bottom:1px solid #a0a0a0;
padding:5px 10px;
}
.explan_here>span{
font-size:13px;
}
.center_line{
border-top:1px solid #a0a0a0;
}
.explan_here>.explan_cont{
padding:3px 16px;
min-height:40px;
height:auto;
color:#5b5a5a;
}
.date_time{
font-size:12px;
}
.nick_show_bt{
font-size:11px;
color:#333;
margin-top:5px;
}
.nick_show_bt .col{
margin-top:10px;
}
.nick_show_bt>.s7{
min-height:25px;
}
.con_div{
font-size:15px;
margin-top:5px;
}
.list_titles{
min-height:25px;
max-height:50px;
}
</style>
<script>
$(document).ready(function(){
	$(".go_se_list").each(function(idx){
		$(this).click(function(){
			$(".go_show_list").eq(idx).attr("action",'${path}/Plyer.do?method=showlist');
			$(".go_show_list").eq(idx).submit();
		});
	});
	$(".show_exp").click(function(){
		
	});
	$("img").click(function(){
		$(location).attr("href","${path}/Plyer.do?method=list");
	});
});
</script>
<%@ include file="/include/top.jsp" %>
<div id="contents">
	<div class="logo_">
		<img src="player/logo.png" width="30%" height="25px;"/>
	</div>
	<video width="100%" height="220px" controls="controls" preload="metadata">
		<source src="${path}/filefolder/${show.fname}">
	</video>
<!-- 	<div style="width:100%;height:220px;border:1px solid black;"></div>	 -->
	<div class="container">
		<div class="con_div">
			<div class="title_left">
			<strong>${show.title}</strong> 
			</div>
			<div class="i_right">
			<i class="material-icons show_exp">keyboard_arrow_up</i>
			</div>
		</div>
		<div class="row nick_show_bt" style="font-size:11px;color:#333;margin-top:5px;">
		<div class="col s7 valign-wrapper">
		<span>${show.nickname} · 조회수 ${show.shower}</span>
		</div>
		<div class="col s5 right-align">
			<c:if test="${show.linker != null && show.linker != ''}">
			<a href="${show.linker}" class="waves-effect waves-light linker_bt">youtube
			<i class="material-icons right" style="margin:2px;font-size:17px;">send</i></a>
			</c:if>
		</div>
		</div>
	</div>
	<div class="center_line"></div>
	<div class="explan_here">
		<c:set var="time" value="${(show.time).substring(0,10)}"/>
		<fmt:parseDate value="${time}" var="dateFmt" pattern="YYYY-MM-dd"/>
		<span>게시일: <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/></span>
		<div class="explan_cont">
		${show.explan}
		</div>
	</div>
	<br>
	<div class="container">
	<c:forEach var="list" items="${clist}">
		<form class="go_show_list" method="post">
		<input type="hidden" name="title" value="${list.title}"/>
		<input type="hidden" name="time" value="${list.time}"/>
		<div class="row go_se_list">
			<div class="col s5">
			<video width="100%" height="70px">
				<source src="${path}/filefolder/${list.fname}">
			</video>
			</div>
			<div class="col s6">
				<div class="list_titles" style="font-size:11px"><strong>${list.title}</strong></div>
				<div style="font-size:10px"><span>${list.nickname}</span>&nbsp;&nbsp;<span>조회수 ${list.shower}</span></div>
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