package com.mycompany.gofarm.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.review.dto.ReviewDTO;
import com.mycompany.gofarm.review.service.ReviewService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	public ReviewController() {
		// TODO Auto-generated constructor stub
	}
	
	//리뷰 작성폼으로 이동
	@RequestMapping("reviewWriteForm.do")
	public ModelAndView reviewWrite( ModelAndView mav, int prod_code) {
		System.out.println("리뷰코드 확인 ="+prod_code);
		System.out.println("리뷰 작성폼 이동");
		mav.addObject("prod_code", prod_code);
		mav.setViewName("review/reviewWrite");
		
		return mav;
	}

	
	//리뷰 작성
	@RequestMapping(value = "reviewWritePro.do" , method= RequestMethod.POST)
	public String reviewWritePro(ReviewDTO rdto , HttpServletRequest req) {
		System.out.println("작성 컨트롤러 진입");
		System.out.println(rdto.getContent());
		System.out.println(rdto.getRe_star());
		System.out.println(rdto.getProd_code());
		HttpSession session = req.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("loginOk");
		rdto.setRe_user(userDTO.getUsercode());
		
		reviewService.reviewInsProcess(rdto);
		
		
		
		return "mypage/intro";
	}
	//리뷰 수정폼 이동
	@RequestMapping("reviewUpdate.do" )
	public ModelAndView reviewUpdate(ModelAndView mav , int re_code) {
		System.out.println("오노??");	
		System.out.println("리뷰번호 : "+ re_code);
		mav.addObject("re_code", re_code);
		mav.addObject("redto", reviewService.reviewUpdProcess(re_code));
		mav.setViewName("review/reviewUpdate");
		return mav;
	}
	
	//리뷰 수정
	@RequestMapping(value = "reviewUpdatePro.do" , method = RequestMethod.POST)
	public String reviewUpdatePro(ReviewDTO redto , HttpServletRequest req) {
		System.out.println("리뷰 등록 진입");		
		System.out.println("리뷰번호 :" +redto.getRe_code());
		System.out.println("상품번호 :" + redto.getProd_code());
		reviewService.reviewUpdateProProcess(redto);
		
		return "mypage/intro";
	}
	//리뷰 삭제
	@RequestMapping("reviewDelete.do")
	public String reviewDelete( int re_code) {
		reviewService.reviewDeleteProcess(re_code);
		
		return "mypage/intro";
	}
	
	
	
	
}
