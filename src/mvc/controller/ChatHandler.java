package mvc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// 채팅 시 바로 실시간으로 처리되는 내용
@Controller("chatHandler")
public class ChatHandler extends TextWebSocketHandler {
	// 접속자 수만큼 WebSocketSession을 설정해서 사용할 수 있는 Map 객체 생성
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	// 접속자의 명단을 client로 보내기 위해
	private ArrayList<String> ids = new ArrayList<String>();
	// 접속자 id와 nickname을 함께 가지고 있는 객체 선언
	private Map<String, String> target = new ConcurrentHashMap<>();

	// 접속 했을 때 처리할 내용
	// 클라이언트에서 넘겨온 websocketsession을 현재 서버단의 리스트에 추가
	// 클라이언트 웹소켓 해당 메서드와 연결
	// wsocket.onopen = onOpen;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + "접속");
		users.put(session.getId(), session);
	}
	
	// 접속을 종료할 때 처리할 내용
	// 클라이언트에서 접속종료 메서드 호출 시 서버에서 현재 메서드를 통해 websession을 삭제
	// 클라이언트 웹소켓 해당 메서드와 연결
	// wsocket.onclose = onClose;
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + "접속 종료");
		users.remove(session.getId());
	}

	// 메시지를 보냈을 때 처리할 내용
	// 클라이언트 웹소켓 해당 메서드와 연결
	// wsocket.onmessage = onMessage;
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log("전송한 id:" + session.getId() + ", 전송된 내용:" + message.getPayload());
		
		// 넘겨온 데이터
		// 구분자(int/msg/del) : 메시지 보낸사람 nickname : 메시지 : 전달할사람 nickname
		String[] msg = message.getPayload().toString().split(":");
		// msg[0] : 구분자
		// msg[1] : 메시지 보내는 사람
		// msg[2] : 메시지
		// msg[3] : 메시지 받는 사람
		/*
			client에서 보내는 nickname과 서버에서 식별자로 사용하는 session을 id로 사용
			1. 서버에서 사용하는 id와 client에서 전달하는 nickname의 데이터를 함께 가지고 있는 저장 객체가 필요하다.
			2. 전역변수를 처리하는 객체를 선언하고 접속시마다 id와 nickname을 저장한다.
		*/
		/*if(msg[0].equals("refuse")) {
			for(WebSocketSession s:users.values()) {
				s.sendMessage(new TextMessage("refuse:" + msg[1] + " : " + msg[2]));
			}
		}*/
		if(msg[0].equals("del")) {
			for(WebSocketSession s:users.values()) {
				s.sendMessage(new TextMessage("del" + msg[1]));
			}
		}
		if(!msg[3].equals("")) {
			for(WebSocketSession s:users.values()) {
				s.sendMessage(new TextMessage(msg[1] + ";" + msg[3]));
			}
		}
		if(msg[0].equals("msg")) {
			for(WebSocketSession s:users.values()) {
				s.sendMessage(new TextMessage(msg[1] + " : " + msg[2]));
			}
		}
		
	}

	public void log(String msg) {
		System.out.println(new Date() + ":" + msg);
	}
	
	// 에러 발생
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 예외발생: " + exception.getMessage());
	}
}
