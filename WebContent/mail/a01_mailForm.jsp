<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui/jquery-ui-1.10.3.custom.css">
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<script src="${path}/a00_com/jquery-1.10.2.js"></script>
<script src="${path}/a00_com/jquery-ui/jquery-ui-1.10.3.custom.js"></script>
<script>
	$(document).ready(function(){
		var msg = "${isSend}";
		if(msg != ""){
			alert(msg);
		}
	});
</script>
</head>
<body>
<h2>메일 전송</h2>
<form method="post" action="${path}/mail.do?method=send">
	<table>
		<tr>
			<td>수신자</td>
			<td><input type="text" name="receiver"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="5" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="메일 전송">
			</td>
		</tr>
	</table>
</form>
</body>
</html>