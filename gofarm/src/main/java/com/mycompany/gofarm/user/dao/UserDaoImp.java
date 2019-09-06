package com.mycompany.gofarm.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.user.dto.UserDTO;

@Repository
public class UserDaoImp implements UserDAO{
	
	
	@Autowired
	//@Qualifier("sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public UserDaoImp() {
		
	}
	
	@Override
	public void signupUser(UserDTO dto) {
		System.out.println(sqlSession);
		System.out.println(dto.getUsercode());
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpw());
		System.out.println(dto.getName());
		System.out.println(dto.getBirth());
		System.out.println(dto.getPhone());
		System.out.println(dto.getEmail());
		System.out.println(dto.getNickname());
		System.out.println(dto.getUserlvl());
		System.out.println(dto.getBank());
		System.out.println(dto.getAccount());
		System.out.println(dto.getMileage());
		System.out.println(dto.getUser_home());
		sqlSession.insert("user.signup", dto);
	}

	@Override
	public void signupdetail(UserDTO dto) {
		sqlSession.insert("user.signupdetail", dto);
	}

}
