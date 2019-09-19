package com.mycompany.gofarm.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//List<UserDTO> chatuserinfo = new ArrayList<UserDTO>();
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	//채팅목록
	@RequestMapping("chatlist.do")
	public ModelAndView chatList(ModelAndView mav, HttpSession session) {
		
		if(session.getAttribute("loginOk") == null) {
			mav.setViewName("redirect:login.do");
		}
		else {
			mav.addObject("roomlist", chatService.roomlistProcess());
			mav.setViewName("chat/chatlist");
		}
		
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
	public ModelAndView chatjoin(ChatRoomDTO cdto, ModelAndView mav,HttpSession session, UserDTO dto) {
		//System.out.println("참가한 방 번호: "+cdto.getChatcode());
		//수정
		/*dto = ((UserDTO)(session.getAttribute("loginOk")));
		dto.setChatcode(cdto.getChatcode());
		chatuserinfo.add(dto);
		List<UserDTO> userlist = new ArrayList<UserDTO>();
		for(UserDTO dt : chatuserinfo) {
			if(dt.getChatcode() == cdto.getChatcode()) {
				if(dt.getUsercode() != ((UserDTO)(session.getAttribute("loginOk"))).getUsercode()) {
					userlist.add(dt);
				}
			}
		}*/
		mav.addObject("chatcode", cdto.getChatcode());
		mav.addObject("roominfo", chatService.getroominfoProcess(cdto.getChatcode()));
		//mav.addObject("userlist", userlist);
		mav.setViewName("chat/chatting");
		return mav;
	}
}
