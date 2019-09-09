package com.mycompany.gofarm.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("회원가입요청");
		return "user/signup";
	}
	
	@RequestMapping("/signuppro.do")
	public String signProc(UserDTO dto) {
		System.out.println(dto.getName());
		userService.signupProcess(dto);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/login.do")
	public String loginForm() {
		return "user/login";
	}
	
	@RequestMapping("/loginpro.do")
	public String loginProc(UserDTO dto, HttpServletRequest req, Model model) {
		if(userService.loginCheck(dto) != null) {
			dto = userService.loginCheck(dto);
			System.out.println(dto.getNickname());
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(30*60);//로그인유지시간 30분
			session.setAttribute("loginOk", dto);
			return "redirect:/main.do";
		}else {
			//req.setAttribute("loginCheck","fail");
			model.addAttribute("loginCheck", "fail");
			//mav.setViewName("redirect:/login.do");
		}
		return "user/login";
	}//end loginProc()
	
	@RequestMapping("/logout.do")
	public String logoutProc(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	
}//end class
