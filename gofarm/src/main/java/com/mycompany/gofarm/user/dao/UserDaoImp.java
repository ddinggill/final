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
		sqlSession.insert("user.signup", dto);
	}

	@Override
	public void signupdetail(UserDTO dto) {
		sqlSession.insert("user.signupdetail", dto);
		sqlSession.update("user.chengelvl", dto.getUsercode());
	}

	@Override
	public UserDTO loginCheck(UserDTO dto) {
		//System.out.println("로그인체크");
		/*System.out.println((int)sqlSession.selectOne("user.logincheck", dto));
		if((int)sqlSession.selectOne("user.logincheck", dto) == 1 ) {
			System.out.println("회원");
			return true;
		}
		else {
			System.out.println("비회원");
			return false;
		}*/
		return sqlSession.selectOne("user.logincheck", dto);
	}//end loginCheck()

	@Override
	public int haskakaoid(String email) {
		return sqlSession.selectOne("user.haskakaoid",email);
	}

	@Override
	public UserDTO getkakaoinfo(String email) {
		
		return sqlSession.selectOne("user.kakaoinfo", email);
	}

	@Override
	public void updateinfo(UserDTO dto) {
		sqlSession.update("user.updateinfo", dto);
	}


}//end class
