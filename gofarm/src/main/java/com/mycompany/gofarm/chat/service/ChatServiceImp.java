package com.mycompany.gofarm.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.chat.dao.ChatDAO;
import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

@Service
public class ChatServiceImp implements ChatService{

	@Autowired
	ChatDAO chatDAO;
	
	public void setChatDAO(ChatDAO chatDAO) {
		this.chatDAO = chatDAO;
	}
	
	@Override
	public List<ChatRoomDTO> roomlistProcess() {
		return chatDAO.getroomList();
	}

}
