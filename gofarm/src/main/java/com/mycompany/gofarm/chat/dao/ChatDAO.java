package com.mycompany.gofarm.chat.dao;

import java.util.List;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

public interface ChatDAO {

	List<ChatRoomDTO> getroomList();
}
