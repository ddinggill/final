package com.mycompany.gofarm.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	public MypageController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping("/intro.do")
	public String intro() {
		return "mypage/intro";
	}
		
	@RequestMapping("/mileage.do")
	public String mileage() {
		return "mypage/mileage";
	}
	
	@RequestMapping("/job.do")
	public String job() {
		return "mypage/job";
	}
	
	@RequestMapping("/jobSearch.do")
	public String jobSearch() {
		return "mypage/jobSearch";
	}
	
	@RequestMapping("/product.do")
	public String product() {
		return "mypage/product";
	}
	
	@RequestMapping("/auction.do")
	public String auction() {
		return "mypage/auction";
	}
	
	@RequestMapping("/donation.do")
	public String donation() {
		return "mypage/donation";
	}
	
	@RequestMapping("/mileage_charge.do")
	public String mileage_charge() {
		return "mypage/mileage_charge";
	}
	
	@RequestMapping("/mileage_payment.go")
	public String mileage_payment() {
		return "mypage/mileage_payment";
	}
	
	
	
	
	
	
	
}
