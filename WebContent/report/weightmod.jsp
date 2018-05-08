<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.sing_kcal_show{
margin-top: -1.6em;
}
.signup_kcal{
font-size:0.74em;
}
</style>
<body>

<script>
$(document).ready(function(){
	$("#test3").click(function(){
		alert("test");
	});
});
</script>
<%@ include file="/include/top.jsp" %>
<div id="contents">
	<div class="container">
		<form>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s10">
					<div class="row">
			       		<div class="input-field col s6">
							<input placeholder="cm" id="tail" type="number" class="validate" name="tail">
			          		<label for="tail">키</label>
			       		</div>
			       		<div class="input-field col s6">
			          		<input placeholder="kg" id="kg" type="number" class="validate" name="kg"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="kg">몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="kg" id="fukg" type="number" class="validate" name="fukg"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="fukg">목표 몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="kcal" id="kcal" type="number" class="validate" name="fukcal"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="kcal">목표 칼로리</label>
			          		<div class="sing_kcal_show">
			          		<span class="signup_kcal">한준안님의 권장 칼로리 섭취는 1024kcal입니다.</span><!-- keyup으로 여기에 권장 칼로리는 정한다 -->
			          		</div>
			       		</div>
			       		
			       		<div class="col s12  center-align">
			       			<br>
			       			<input type="submit" value="수정하기" class="btn waves-effect waves-light"/>
			       		</div>
					</div>
				</div>
		</form>
	</div>
</div>
</body>
</html>