<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.chatting .chatInput{
	position: absolute;
	bottom: 0;
	width: 97%;
}
</style>
<script>
	/*
		server의 ChatHandler와 연동되어 처리
		1. websocket 연결 처리
			1) 객체 생성: new WebSocket("서버의 handler를 호출")
			2) 연결 처리 메서드: onopen
			3) 메시지 전송 시 메서드: onmessage
			4) 연결 해제 메서드: onclose
	*/
	var wsocket;
	// 초기 연결 처리 함수
	function connect(){
		// 외부에서 현재 서버에 접속해야 하기 때문에 local IP 주소 확인
		// handler 연결은 스프링 테이너 설정 파일에 있음
		wsocket = new WebSocket("ws://192.168.35.132:7080/${path}/chat-ws.do");
		// 서버에 연결이나 종료 후에
		// 다시 클라이언트 단에서 호출 되어 처리할 메서드 정의
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function onOpen(evt){
		alert("연결되었습니다.");
		wsocket.send("from:" + $("#nicknameMe").val() + ":" + "to:" + $("#nicknameYou").val());
	}
	function onClose(evt){
		alert("접속 종료합니다");
	}
	function onMessage(evt){
		var revMsg = evt.data;
		var revMsgIdx;
		if(revMsg.indexOf(":") > -1){
			revMsgIdx = revMsg.split(":");
			//console.log(revMsgIdx[1]);
			if(revMsgIdx[0].trim() == $("#nicknameMe").val()){
				var msgHtml = "<div class='card-panel teal msgYou'><span class='white-text'>";
				msgHtml += revMsgIdx[1] + "</span></div>";
		          
				$("#chatMessageArea").append("<div style='overflow:hidden;'><p class='me'>" + revMsgIdx[0].trim() + "</p>" + msgHtml + "</div>");
				
			}else if(revMsgIdx[0].trim() == $("#nicknameYou").val()){
				var msgHtml = "<div class='card-panel'><span>";
				msgHtml += revMsgIdx[1] + "</span></div>";
				
				$("#chatMessageArea").append("<div><p class='you'>" + revMsgIdx[0].trim() + "</p>" + msgHtml + "</div>");
			}
			$("#chatMessageArea").scrollTop($("#chatMessageArea")[0].scrollHeight);
		}else if(revMsg.indexOf("del") > -1){
			if(revMsg.substring(3) != $("#nicknameMe").val()){
				alert(revMsg.substring(3) + "남이 채팅방을 나가셨습니다.");
			}
			
		}
	}
	var user = "";
	
	function disconnect(){
		wsocket.send("del:" + $("#nicknameMe").val());
		wsocket.close();
		$(location).attr("href", "${path}/main/main.jsp");
	}
	function send(){
		var nickname = $("#nicknameMe").val();
		var msg = $("#message").val();
		// wsocket.send("msg:" + nickname + ":" + msg + ": " + user);
		// ": " -> 공백이 들어가야 함(chathandler에서 구분자를 통한 배열 생성 시 마지막 user값이 없으면 에러가 뜨므로 공백이 들어가야함)
		wsocket.send("msg:" + nickname + ":" + msg + ": " + user);
		$("#message").val("");
	}
	$(document).ready(function(){
		//세션 확인
		var sessionId = "${member.email}";
		if(sessionId == null || sessionId == ""){
			$(location).attr("href", "${path}/index.jsp");
		}
		
		connect();
		
		$("#message").keypress(function(event){
			var keycode = (event.keyCode? event.keyCode:event.which);
			if(keycode == 13) send();
			event.stopPropagation();
		});
		
		$("#exitBtn").click(function(){
			disconnect();
		});
		$("#sendBtn").click(function(){
			send();
		});
	});
</script>
<body>
<%@ include file="/include/top.jsp" %>
<input type="hidden" id="nicknameMe" value="${member.nickname}"/>
<input type="hidden" id="nicknameYou" value="${param.nick}"/>
<div id="chatArea">
	<div id="exitBtn">
		<i class="material-icons dp48">arrow_back</i> 나가기
	</div>
	<div id="chatMessageArea"></div>
</div>
<div class="sendmessage">
	<input type="text" id="message"/>
	<button type="button" id="sendBtn" class="waves-effect waves-light btn">
		<i class="material-icons dp48">near_me</i>
	</button>
</div>
</body>
</html>