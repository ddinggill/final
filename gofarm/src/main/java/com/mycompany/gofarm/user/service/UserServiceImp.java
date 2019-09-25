package com.mycompany.gofarm.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.user.dao.UserDAO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserDAO userDao;
	
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	public UserServiceImp() {
		
	}

	@Override
	public void signupProcess(UserDTO dto) {
		userDao.signupUser(dto);
	}
	
	@Override
	public void detailsignupProcess(UserDTO dto) {
		userDao.signupdetail(dto);
	}
	
	@Override
	public UserDTO loginCheckProcess(UserDTO dto) {
		
		return userDao.loginCheck(dto);
	}
	
	@Override
	public UserDTO kakaologinProcess(UserDTO dto) {
		/*System.out.println(dto.getNickname());
		System.out.println(dto.getEmail());
		System.out.println(dto.getBirth());*/
		int cnt = userDao.haskakaoid(dto.getEmail());
		if(cnt == 0) {
			System.out.println("새로윤 소셜로그인 유저 회원가입 시작");
			String randomIdPw = "";
			for(int i=1; i<=10; i++) {
				char ch = (char)((Math.random()*26)+97);
				randomIdPw +=ch;
			}
			System.out.println(randomIdPw);
			dto.setName("undefine");
			dto.setUserid(randomIdPw);
			dto.setUserpw(randomIdPw);
			dto.setPhone("undefine");
			userDao.signupUser(dto);
		}
		dto = userDao.getkakaoinfo(dto.getEmail());
		System.out.println("소셜 유저코드: "+dto.getUsercode());
		return dto;
	}//end kakaologinProcess()
	
	@Override
	public void updateProcess(UserDTO dto) {
		userDao.updateinfo(dto);
	}
	@Override
	public int idchkProcess(String userid) {
		return userDao.idchk(userid);
	}
	
}//end class
