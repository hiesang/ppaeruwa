<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<script>
$(document).ready(function(){
	var height = $(document).height();
	$(".wrap").css("height", height + "px");
	$(".bg_color").css("height", height + "px");
});
</script>
<body class="wrap">
<div class="bg_color">PPAERUWA</div>
<div class="mem-move-btn">
	<div class="row">
		<div class="col s12 center-align">
			<a href="${path}/member/login.jsp" class="waves-effect waves-light btn" style="margin-right:20px">로그인</a>
			<a href="${path}/member/signup.jsp" class="waves-effect waves-light btn">회원가입</a>
		</div>
	</div>
</div>
</body>
</html>