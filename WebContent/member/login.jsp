<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<script>
$(document).ready(function(){
	// 세션 확인
	var sessionId = "${member.email}";
	if(sessionId != null && sessionId != ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}
	
	$("#login").click(function(){
		var sendData = $("form").serialize();
		$.ajax({
			type: "post",
			url: "${path}/member.do?method=login",
			data: sendData,
			success:function(data){
				if(data == "이메일 또는 비밀번호를 다시 확인해주세요."){
					alert(data);
				}else if(data == "로그인 성공입니다."){
					$(location).attr("href", "${path}/main.do?method=main");
				}
			}
		});
	});
});
</script>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents" class="login">
	<div class="container">
		<form>
			<div class="row">
				<div class="input-field col s12">
					<input id="emailId" type="text" class="validate" name="email">
					<label for="emailId" class="label">이메일 입력</label>
		        </div>
		        <div class="input-field col s12">
					<input id="password" type="password" class="validate" name="password">
					<label for="password" class="label">비밀번호 입력(6~12자)</label>
		        </div>
		        <div class="col s12 center login-btn">
		        	<button class="btn waves-effect waves-light" type="button" id="login">로그인</button>
		        </div>
			</div>
		</form>
		<ul class="mem-move clearfix">
			<li class="first"><a href="${path}/member/idfind.jsp">ID/PW를 잊어버렸나요?</a></li>
			<li><a href="${path}/member/signup.jsp">회원이 아니신가요?</a></li>
		</ul>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>