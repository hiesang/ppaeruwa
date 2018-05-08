<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<%@ include file="/include/top.jsp" %>
<script>
$(document).ready(function(){
	//세션 확인
	var sessionId = "${member.email}";
	if(sessionId != null && sessionId != ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}
});
function formPopup(){
	window.open("", "pop", "width=400, height=205");
	document.getElementById("form").submit();
}
</script>
<!-- contents -->
<div id="contents" class="login">
	<div class="container">
		<div class="footform">
			<form method="post" id="form" action="${path}/member.do?method=findid" target="pop">
				<div class="row">
					<div class="input-field col s12 ">
						<input id="name" type="text" class="validate" name="name">
						<label for="name" class="label">이름</label>
			        </div>
					<div class="input-field col s12">
						<input id="tel" type="text" class="validate" name="tel">
						<label for="tel" class="label">연락처('-'제외)</label>
			        </div>
					<div class="input-field col s12">
						<input id="birth" type="text" class="validate" name="birth">
						<label for="birth" class="label">생년월일(YYYYMMDD)</label>
			        </div>
			        <div class="col s12 center login-btn">
			        	<input class="btn waves-effect waves-light modal-trigger" type="button" value="아이디 찾기" onclick="formPopup()">
			        </div>
				</div>
			</form>
			<ul class="mem-move clearfix">
				<li class="first"><a href="${path}/member/pwfind.jsp">비밀번호를 잊어버렸나요?</a></li>
				<li><a href="${path}/member/signup.jsp">회원이 아니신가요?</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>