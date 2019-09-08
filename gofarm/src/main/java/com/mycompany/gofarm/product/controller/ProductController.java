package com.mycompany.gofarm.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("/productList.do")
	public ModelAndView productList(ModelAndView mav) {
		
		mav.setViewName("product/shopList");
		return mav;
	}
	@RequestMapping("singview.do")
	public ModelAndView productSingleView(ModelAndView mav) {
		
		mav.setViewName("product/shopList");
		
		return mav;
	}
	
	
	
}
