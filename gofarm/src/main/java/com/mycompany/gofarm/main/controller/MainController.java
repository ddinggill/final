package com.mycompany.gofarm.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.chat.dto.ChatRoomDTO;
import com.mycompany.gofarm.chat.service.ChatService;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.service.ProductService;

@Controller
public class MainController {

	@Autowired
	ChatService chatService;
	@Autowired
	ProductService productService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public MainController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("main.do")
	public ModelAndView maingo(ModelAndView mav) {
		
		
		PageDTO pagedto = new PageDTO(1,productService.countProcess());
		List<ChatRoomDTO> clist = chatService.roomlistProcess();
		List<ProductDTO > pList = productService.productListService(pagedto);
		
		mav.addObject("cList", clist);
		mav.addObject("pList", pList);
		
		
		mav.setViewName("main/index");		
		return mav;
	}
	
	@RequestMapping("info.do")
	public String info() {
		
		return "info/info";
	}
}
