package com.mycompany.gofarm.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.gofarm.user.dto.UserDTO;
import com.mycompany.gofarm.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public UserController() {
		
	}
	
	@RequestMapping("/signup.do")
	public String signForm() {
		return "user/signup";
	}
	
	@RequestMapping("/signuppro.do")
	public String signProc(UserDTO dto) {
		System.out.println(dto.getName());
		userService.signupProcess(dto);
		return "redirect:/main.do";
	}
}
