<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.a0{
border:1px solid #ccc;
}
.a1{
margin:0 auto;
text-align:center;
}
.a2{
text-align:center;
}
.a3{
height:100px;
width:88%;

}
.a4{

}
.a5{
border:1px solid #ccc;
height:200px;
width:88%;
margin:0 auto;
}
.a7{
text-align:center;
}
#b2{
margin:0 auto;
color:powderblue;
}
#b3{
margin:0 auto;
color:powderblue;
}
#b4{
margin:0 auto;
color:powderblue;
}
</style>
<script>
$(document).ready(function(){
	$("#b2").click(function(){
		alert("사진 업로드하기");
	});
});
</script>
<body>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents">
<!-- container -->
<div class="container">


<div class="row">
	<div class="col s12 a1">
		<h5><p class="material-icons large" id="b3">chevron_left</p>날짜<p class="material-icons large" id="b4">chevron_right</p></h5>	
	</div>
	
	<div class="col s12 a2">
		<textarea class="a3" row="20" cols="50" name="dcon" placeholder="글을 입력하세요"> </textarea>
	</div>
	
	<div class="col s12 a4">
		
		<div class="a5 center-align valign-wrapper" id="b1">
		<i class="material-icons medium" id="b2">add</i>
		</div>
		
	</div>
	<br>
	<br>
	<div class="col s12 a6">
	<br>
		<div class="a7">
		<a class="waves-effect waves-light btn">등록하기</a>
		
		</div>

	</div>




</div>
<!-- /container -->
</div>
<!-- /contents -->
</div>
</body>
</html>