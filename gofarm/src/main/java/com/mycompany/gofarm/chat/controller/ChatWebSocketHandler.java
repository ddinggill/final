package com.mycompany.gofarm.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.mycompany.gofarm.chat.dto.ChatDTO;
import com.mycompany.gofarm.chat.service.ChatService;

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
	
	@Autowired
	ChatService chatService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " 연결됨");
		LOG.info(session.getId()+"로그인 완료");
		super.afterConnectionEstablished(session);
		
		//방에 입장한 정보로 데이터 세팅
		Map<String, Object> map = session.getAttributes();
		System.out.println(map.get("nickname")+"님"+map.get("chatcode") + "방 접속");
		int chatcode = (int)map.get("chatcode");
		String nickname = (String)map.get("nickname");
		userlist.add(session);
		roominfo.put(session, chatcode);
		nicknameinfo.put(session, nickname);
		nickandroominfo.put(nickname, chatcode);
		System.out.println("새로운 사용자 접속,접속한 사람수: "+userlist.size());
		
		//입장한 사용자에게 기존 채팅내용 보내주기
		List<ChatDTO> dbchat = chatService.getdbchatProcess(chatcode);
		System.out.println(dbchat.size());
		if(dbchat.size()>0) {
			Gson dbchatgson = new Gson();
			String dbchatJson = dbchatgson.toJson(dbchat);
			TextMessage dbchatMessage = new TextMessage(dbchatJson);
			session.sendMessage(dbchatMessage);
		}
		//입장한 사용자에게 환영메세지 보내기
		Date d = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		ChatDTO welcomemsg = new ChatDTO(day.format(d),chatcode,"운영자","오픈채팅방에 참가하셨습니다.","welcome");
		Gson welcomegson = new Gson();
		String welcomeJson = welcomegson.toJson(welcomemsg);
		TextMessage welcomeMessage = new TextMessage(welcomeJson);
		session.sendMessage(welcomeMessage);
		
		//참가한 방의 기존 사용자들에게 새로운유저의 입장메세지 보내기
		ChatDTO joinmsg = new ChatDTO(day.format(d),chatcode,nickname,"님이 참가하셨습니다.","join");
		Gson joingson = new Gson();
		String joinJson = joingson.toJson(joinmsg);
		TextMessage joinMessage = new TextMessage(joinJson);
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == chatcode) {
				if(ws != session) {
					ws.sendMessage(joinMessage);
				}
			}
		}
		
		//접속유저리스트 업데이트
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
		
		ChatDTO msg = new Gson().fromJson(message.getPayload(),ChatDTO.class);
		/*System.out.println(msg.getChatcode());
		System.out.println(msg.getCt_content());
		System.out.println(msg.getCt_nickname());
		System.out.println(msg.getCt_time());
		System.out.println(msg.getType());*/
		
		chatService.insertmsgProcess(msg);
		//System.out.println(chatcode+"방에서 메시지전송");
		/*for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == msg.getChatcode()) {
				if(ws != session) {
					ws.sendMessage(message);
				}
			}
		}*/
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == msg.getChatcode()) {
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
		//퇴장시 방에있는 유저에게 퇴장메세지 보내기
		Date d = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		ChatDTO outmsg = new ChatDTO(day.format(d),roominfo.get(session),nicknameinfo.get(session),"님이 퇴장하셨습니다.","bye");
		Gson outgson = new Gson();
		String outJson = outgson.toJson(outmsg);
		TextMessage outMessage = new TextMessage(outJson);
		
		//TextMessage sendmessage = new TextMessage(nicknameinfo.get(session)+"님이 퇴장하셨습니다");
		
		for(WebSocketSession ws : userlist) {
			if(roominfo.get(ws) == roominfo.get(session)) {
				if(ws != session) {
					ws.sendMessage(outMessage);
				}
			}
		}
		nickandroominfo.remove(nicknameinfo.get(session));
		/*roominfo.remove(session);
		userlist.remove(session);
		nicknameinfo.remove(session);*/
		LOG.info(session.getId()+"로그아웃 완료");
		
		//접속유저리스트 업데이트
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
		System.out.println("사용자 접속해제,접속한 사람수: "+userlist.size());
	}//end afterConnectionClosed();
	
}//end class

