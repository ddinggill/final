package com.mycompany.gofarm.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class TestInterceptor extends HttpSessionHandshakeInterceptor{
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// TODO Auto-generated method stub
		
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        //String id = (String)req.getSession().getAttribute("id");
        int chatcode = Integer.parseInt(req.getParameter("chatcode"));
        String nickname = req.getParameter("nickname");
        System.out.println("인터셉서 chatcode:" + chatcode);
        //attributes.put("userId", id);
        attributes.put("chatcode", chatcode);
        attributes.put("nickname", nickname);
        //System.out.println("HttpSession에 저장된 id:"+id);
        //System.out.println("HttpSession에 저장된 chatcode:"+chatcode);
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
}
