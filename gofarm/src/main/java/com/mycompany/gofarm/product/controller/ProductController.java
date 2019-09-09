package com.mycompany.gofarm.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	private int currentPage;
	
	/*@Autowired*/
	private PageDTO pageDTO;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	
	
	
	
	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("/productList.do")
	public ModelAndView productList(ModelAndView mav , PageDTO pv) {
		System.out.println("test");
		int totalRecord = productService.countProcess();
		
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
			pageDTO = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pageDTO);
			mav.addObject("pd_dto", productService.productListService(pageDTO));
		}
		
		mav.setViewName("product/shopList");
		return mav;
	}
	
	@RequestMapping("productView.do")
	public ModelAndView productSingleView(ModelAndView mav , int prod_code , int currentPage) {
		ProductDTO dto = productService.productViewProcess(prod_code);
		System.out.println("test");
		System.out.println(dto.getPd_name());
		mav.addObject("pd_dto", productService.productViewProcess(prod_code));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("product/product-single");
		
		return mav;
	}
	@RequestMapping("productPay.do")
	public ModelAndView productPayView(ModelAndView mav, int prod_code) {
		
		mav.addObject("pd_dto", productService.productViewProcess(prod_code));
		
		
		mav.setViewName("product/productpay");
		return mav;
	}
	
	
	
}
