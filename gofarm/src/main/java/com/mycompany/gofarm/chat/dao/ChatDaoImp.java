package com.mycompany.gofarm.chat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;

@Repository
public class ChatDaoImp implements ChatDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChatRoomDTO> getroomList() {
		return sqlSession.selectList("chat.roomlist");
	}

}
