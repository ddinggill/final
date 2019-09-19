package com.mycompany.gofarm.chat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.chat.dto.ChatDTO;
import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

@Repository
public class ChatDaoImp implements ChatDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChatRoomDTO> getroomList() {
		return sqlSession.selectList("chat.roomlist");
	}

	@Override
	public void createRoom(ChatRoomDTO dto) {
		sqlSession.insert("chat.createroom", dto);
	}

	@Override
	public ChatRoomDTO getroominfo(int chatcode) {
		return sqlSession.selectOne("chat.roominfo", chatcode);
	}

	@Override
	public void insertmsg(ChatDTO dto) {
		sqlSession.insert("chat.insertmsg",dto);
	}

	@Override
	public List<ChatDTO> getdbchat(int chatcode) {
		return sqlSession.selectList("chat.dbchat", chatcode);
	}

}
