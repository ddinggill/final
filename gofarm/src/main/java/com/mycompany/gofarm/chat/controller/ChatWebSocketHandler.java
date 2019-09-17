package com.mycompany.gofarm.chat.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Map<String,WebSocketSession> users = new ConcurrentHashMap<String,WebSocketSession>();
	private Map<String,WebSocketSession> user1 = new ConcurrentHashMap<String,WebSocketSession>();
	private Map<String,WebSocketSession> user2 = new ConcurrentHashMap<String,WebSocketSession>();
	
	private static final Log LOG = LogFactory.getLog(ChatWebSocketHandler.class);
	
	/*
	 * 클라이언트가 연결되면, 클라이언트의 관련된 WebSocketSession을 users 맵에 저장한다.
	 * 이 users 맵은 채팅 메시지를 연결된 전체 클라이언트에 전달할 때 사용
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " 연결됨");
		//users.put(session.getId(), session);
		LOG.info(session.getId()+"로그인 완료");
		super.afterConnectionEstablished(session);
		Map<String, Object> map = session.getAttributes();
		System.out.println(map.get("num") + "방 접속");
		int usernum = (int)map.get("num");
		if(usernum == 1) {
			users.put(session.getId(), session);
		}else if(usernum == 2) {
			user1.put(session.getId(), session);
		}
		TextMessage welcomeMessage = new TextMessage("msg: 오픈채팅방에 참가하셨습니다.");
		session.sendMessage(welcomeMessage);
	}
	
	/*
	 * 클라이언트가 전송한 메시지를 users 맵에 보관한 전체 WebSocketSession에 다시 전달한다.
	 * 클라이언트는 메시지를 수신하면 채팅 영역에 보여주도록 구현.
	 * 특정 클라이언트가 채팅 메시지를 서버에 보내면 전체 클라이언트는 다시 그 메시지를 받아서 화면에 보여주게 된다.
	 */

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
		LOG.info(session.getId()+" : "+message.getPayload());
		int num = Integer.parseInt(message.getPayload().substring(message.getPayload().length()-1, message.getPayload().length()));
		TextMessage sendmessage = new TextMessage(message.getPayload().substring(0, message.getPayload().length()-1));
		if(num == 1){
			for(WebSocketSession s : users.values()) {
				if(!(s.getId() == session.getId()))
					s.sendMessage(sendmessage);
					//System.out.println(s.getId() + "에 메시지 발송 : " + message.getPayload());
			}
		}else if(num == 2) {
			for(WebSocketSession s : user1.values()) {
				if(!(s.getId() == session.getId()))
					s.sendMessage(sendmessage);
					//System.out.println(s.getId() + "에 메시지 발송 : " + message.getPayload());
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
		LOG.info(session.getId()+"로그아웃 완료");
	}
	
}

