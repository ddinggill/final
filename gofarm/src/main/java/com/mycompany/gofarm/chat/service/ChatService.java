package com.mycompany.gofarm.chat.service;

import java.util.List;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

public interface ChatService {

	public List<ChatRoomDTO> roomlistProcess();
	public void createroomProcess(ChatRoomDTO dto);
	public ChatRoomDTO getroominfoProcess(int chatcode);
}
