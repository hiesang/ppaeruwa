<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<%@ include file="/include/top.jsp" %>
<script>
$(document).ready(function(){
	// 세션 확인
	var sessionId = "${member.email}";
	if(sessionId != null && sessionId != ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}
	
	// 비밀번호 이메일로 전송
	var msg01 = "${mailSend01}";
	var msg02 = "${mailSend02}";
	if(msg01 != ""){
		alert(msg01);
	}else if(msg02 != ""){
		alert(msg02);
		$(location).attr("href", "${path}/member/login.jsp");
	}
});
</script>
<!-- contents -->
<div id="contents" class="login">
	<div class="container">
		<div class="footform">
			<form method="post" action="${path}/member.do?method=findpw">
				<div class="row">
					<div class="input-field col s12">
					<input id="emailId" type="text" class="validate" name="email">
					<label for="emailId" class="label">이메일 입력</label>
		        </div>
					<div class="input-field col s12">
						<input id="tel" type="text" class="validate" name="tel">
						<label for="tel" class="label">연락처('-'제외)</label>
			        </div>
			       
			        <div class="col s12 center login-btn">
			        	<input class="btn waves-effect waves-light modal-trigger" type="submit" value="비밀번호 찾기">
			        </div>
				</div>
			</form>
			<ul class="mem-move clearfix">
				<li class="first"><a href="${path}/member/idfind.jsp">아이디를 잊어버렸나요?</a></li>
				<li><a href="${path}/member/signup.jsp">회원이 아니신가요?</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>