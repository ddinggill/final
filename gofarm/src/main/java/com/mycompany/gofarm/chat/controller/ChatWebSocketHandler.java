package com.mycompany.gofarm.chat.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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

	private Map<WebSocketSession,Integer> roominfo = new ConcurrentHashMap<WebSocketSession,Integer>();
	private Map<WebSocketSession,String> nicknameinfo = new ConcurrentHashMap<WebSocketSession,String>();
	private Map<String, Integer> nickandroominfo = new ConcurrentHashMap<String,Integer>();
	private List<WebSocketSession> userlist = new ArrayList<>();
	
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
		System.out.println(map.get("nickname")+"님"+map.get("chatcode") + "방 접속");
		int chatcode = (int)map.get("chatcode");
		String nickname = (String)map.get("nickname");
		userlist.add(session);
		roominfo.put(session, chatcode);
		nicknameinfo.put(session, nickname);
		nickandroominfo.put(nickname, chatcode);
		System.out.println("새로운 사용자 접속,접속한 사람수: "+userlist.size());
		TextMessage welcomeMessage = new TextMessage("운영자: 오픈채팅방에 참가하셨습니다.");
		session.sendMessage(welcomeMessage);
		
		TextMessage sendmessage = new TextMessage(nickname+"님이 접속하셨습니다");
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == chatcode) {
				if(ws != session) {
					ws.sendMessage(sendmessage);
				}
			}
		}
		
		String users="users";
		Iterator<String> keys = nickandroominfo.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			if((int)nickandroominfo.get(key) == chatcode) {
					users +=","+key;
			}
		}
		System.out.println(users);
		TextMessage nicklist = new TextMessage(users);
		
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == chatcode) {
				ws.sendMessage(nicklist);
			}
		}
		
	}//end afterConnectionEstablished()
	
	/*
	 * 클라이언트가 전송한 메시지를 users 맵에 보관한 전체 WebSocketSession에 다시 전달한다.
	 * 클라이언트는 메시지를 수신하면 채팅 영역에 보여주도록 구현.
	 * 특정 클라이언트가 채팅 메시지를 서버에 보내면 전체 클라이언트는 다시 그 메시지를 받아서 화면에 보여주게 된다.
	 */

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId() + "로부터 메시지 수신 : " + message.getPayload());
		LOG.info(session.getId()+" : "+message.getPayload());
		/*int num = Integer.parseInt(message.getPayload().substring(message.getPayload().length()-1, message.getPayload().length()));
		TextMessage sendmessage = new TextMessage(message.getPayload().substring(0, message.getPayload().length()-1));*/
		int chatcode = roominfo.get(session);
		System.out.println(chatcode+"방에서 메시지전송");
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == chatcode) {
				if(ws != session) {
					ws.sendMessage(message);
				}
			}
		}
		
	}//end handleTextMessage()
	

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
		TextMessage sendmessage = new TextMessage(nicknameinfo.get(session)+"님이 퇴장하셨습니다");
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == roominfo.get(session)) {
				if(ws != session) {
					ws.sendMessage(sendmessage);
				}
			}
		}
		nickandroominfo.remove(nicknameinfo.get(session));
		/*roominfo.remove(session);
		userlist.remove(session);
		nicknameinfo.remove(session);*/
		System.out.println("사용자 접속해제,접속한 사람수: "+userlist.size());
		LOG.info(session.getId()+"로그아웃 완료");
		
		String users="users";
		Iterator<String> keys = nickandroominfo.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			if((int)nickandroominfo.get(key) == roominfo.get(session)) {
					users +=","+key;
			}
		}
		System.out.println(users);
		TextMessage nicklist = new TextMessage(users);
		
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == roominfo.get(session)) {
				if(ws != session) {
					ws.sendMessage(nicklist);
				}
			}
		}
		
		roominfo.remove(session);
		userlist.remove(session);
		nicknameinfo.remove(session);
	}//end afterConnectionClosed();
	
}//end class

