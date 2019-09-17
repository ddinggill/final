package com.mycompany.gofarm.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;
import com.mycompany.gofarm.chat.service.ChatService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	//채팅목록
	@RequestMapping("chatlist.do")
	public ModelAndView chatList(ModelAndView mav) {
		
		mav.addObject("roomlist", chatService.roomlistProcess());
		mav.setViewName("chat/chatlist");
		
		return mav;
	}
	
	@RequestMapping("createroomform.do")
	public String creatroomForm() {
		
		return "chat/createroomForm";
	}
	
	@RequestMapping("createroom.do")
	public ModelAndView createroom(ChatRoomDTO dto, ModelAndView mav,HttpServletRequest req) {
		HttpSession session = req.getSession();
		dto.setUsercode(((UserDTO)session.getAttribute("loginOk")).getUsercode());
		chatService.createroomProcess(dto);
		mav.setViewName("redirect:chatlist.do");
		
		return mav;
	}
	
	@RequestMapping("chatjoin.do")
	public ModelAndView chatjoin(ChatRoomDTO dto, ModelAndView mav,HttpServletRequest req) {
		System.out.println("참가한 방 번호: "+dto.getChatcode());
		//System.out.println(dto.getUsercode());
		mav.addObject("dto", dto);
		mav.setViewName("chat/chat");
		return mav;
	}
}
