package com.mycompany.gofarm.chat.dao;

import java.util.List;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

public interface ChatDAO {

	public List<ChatRoomDTO> getroomList();
	public void createRoom(ChatRoomDTO dto);
	public ChatRoomDTO getroominfo(int chatcode);
}
