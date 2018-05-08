<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<style>
	#contents.findId{
		padding: 0;
	}
	.findId .card{
		margin: 0;
	}
</style>
<div id="contents" class="findId">
	<div class="card">
		<div class="card-content">
			<span class="card-title">아이디 찾기</span><br>
			<div class="center-align">
				<c:choose>
					<c:when test="${userId != null && userId != ''}">
						회원님의 이메일은 ${userId}입니다.
					</c:when>
					<c:otherwise>
						회원님의 정보가 존재하지 않습니다.
					</c:otherwise>
				</c:choose>
			</div>
			<br>
		</div>
		<div class="card-action right-align">
			<a href="#" onclick="window.close()">닫기</a>
		</div>
	</div>
</div>
<!-- contents -->
</body>
</html>