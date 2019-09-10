package com.mycompany.gofarm.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	public MainController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/main.do")
	public String maingo() {
		return "main/index";
	}


}
