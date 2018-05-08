<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<script>
$(document).ready(function(){

});
</script>
	<%
		session.invalidate();
	%>
	<script>
		location.href = '${path}/index.jsp';
	</script>

</body>
</html>