<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<body>
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/top.jsp" %>
<script>
$(document).ready(function(){
	$("tr").each(function(){
		$(this).click(function(){
			var email = $(this).children(".email").html();
			$("input[name=email]").val(email);
			alert($("input[name=email]").val());
			$("#listform").attr("action","${path}/timeline.do?method=userline");
			$("#listform").submit();
		});
	});
});
</script>
<div id="contents">
	<div class="container">
	    <table border>
			<c:forEach var="ul" items="${userlist}">
		    	<tr><td class="email">${ul.email}</td><td>${ul.nickname}</td><td>${ul.name}</td></tr>
			</c:forEach>
		  	</table>
		</div>
		
		<form id="listform" method="post">
			<input type="hidden" name="email"/>
		</form>
</div>
</body>
</html>