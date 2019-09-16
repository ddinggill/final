package com.mycompany.gofarm.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;
import com.mycompany.gofarm.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	
	@RequestMapping("chatlist.do")
	public ModelAndView chatList(ModelAndView mav) {
		
		mav.addObject("roomlist", chatService.roomlistProcess());
		mav.setViewName("chat/chatlist");
		
		return mav;
	}
}
