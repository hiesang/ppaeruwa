<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<%@ include file="/include/main_top.jsp" %>
<script>
var wsocket;
function connect(){
	wsocket = new WebSocket("ws://192.168.35.132:7080/${path}/chat-ws.do");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}
function onOpen(evt){
	//alert("연결되었습니다.");
	wsocket.send("from:" + $("#nicknameMe").val() + ":" + "to: ");
}
function onClose(evt){
	alert("접속 종료합니다");
}
function onMessage(evt){
	var revMsg = evt.data;
	console.log(revMsg);
	var revMsgIdx = revMsg.split(";");
	console.log("revMsgIdx0" + revMsgIdx[0]);
	console.log("revMsgIdx1" + revMsgIdx[1]);
	if(revMsgIdx[1] != " " && revMsgIdx[1] != null){
		/* console.log(revMsgIdx[1]);
		console.log($("#nicknameMe").val()); */
		if(revMsgIdx[1].trim() == $("#nicknameMe").val()){
			if(confirm(revMsgIdx[0] + "님이 " + revMsgIdx[1] + "님에게 채팅 요청을 하셨습니다.")){
				$(location).attr("href", "${path}/chatting/chatForm.jsp?nick=" + revMsgIdx[0]);
			}else{
				//wsocket.send("refuse:" + revMsgIdx[1] + "님이 채팅 요청을 거절하셨습니다.");
			}
		}
	}
	
}
function disconnect(){
	wsocket.send("del:" + $("#nicknameMe").val());
	wsocket.close();
	$("#nicknameMe").val("");
	$("p").html("");
	$("#chatMessageArea").html("");
}

var sessionId;
$(document).ready(function(){
	// 세션 확인
	sessionId = "${member.email}";
	if(sessionId == null || sessionId == ""){
		$(location).attr("href", "${path}/index.jsp");
	}
	
	connect();
});
</script>
<!-- contents -->
<div id="contents" class="main">
	<div class="user_main">
		<div class="row user_account">
			<div class="col s12">
				<!-- <i class="material-icons dp48">account_circle</i> 홍길동 -->
				<input type="hidden" id="nicknameMe" value="${member.nickname}"/>
				<div class="chip">
					<img src="${path}/filefolder/${profile}" alt="Contact Person">
					${member.nickname}
	 			</div>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m6">
				<div class="card">
					<div class="card-content">
						<span class="card-title">반성일기</span>
						<p>${reflect.comments }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col s12 main_alink">
				<a class="waves-effect waves-light btn blue-grey darken-1" href="${path}/today/diet.jsp">오늘의 식단</a>
				<a class="waves-effect waves-light btn blue-grey darken-1" href="${path}/sport.do?method=list">오늘의 운동</a>
				<a class="waves-effect waves-light btn blue-grey darken-1" href="${path}/no/diary.jsp">오늘의 일기</a>
			</div>
		</div>
	</div>
</div>
<!-- content -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>