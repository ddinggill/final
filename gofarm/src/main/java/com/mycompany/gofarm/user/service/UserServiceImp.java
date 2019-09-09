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
	public UserDTO loginCheck(UserDTO dto) {
		
		return userDao.loginCheck(dto);
	}
}
