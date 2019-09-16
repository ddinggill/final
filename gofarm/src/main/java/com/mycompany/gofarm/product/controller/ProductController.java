package com.mycompany.gofarm.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.product.dto.DealDTO;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.service.ProductService;
import com.mycompany.gofarm.user.dto.UserDTO;
import com.mycompany.gofarm.user.service.UserService;

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
	
	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
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
	public ModelAndView productSingleView(ModelAndView mav , int prod_code , int currentPage, HttpServletRequest req) {
		ProductDTO dto = productService.productViewProcess(prod_code);
		//System.out.println("test");
		System.out.println(dto.getPd_name());
		HttpSession session = req.getSession();
		if(session.getAttribute("loginOk") != null) {
			UserDTO user = (UserDTO) session.getAttribute("loginOk");
			mav.addObject("user", user);
		
		}
		
		
		mav.addObject("review", productService.reviewListService(prod_code));
		mav.addObject("pd_dto", productService.productViewProcess(prod_code));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("product/product-single");
		
		return mav;
	}
	@RequestMapping("productPay.do")
	public ModelAndView productPayView(ModelAndView mav, int prod_code, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginOk") != null) {
		mav.addObject("pd_dto", productService.productViewProcess(prod_code));
		UserDTO dto = (UserDTO) session.getAttribute("loginOk");
		//System.out.println("코드"+dto.getUsercode());
		int usercode = dto.getUsercode();
		mav.addObject("user", productService.userInfoService(usercode));
		mav.addObject("detail", productService.detailInfoService(usercode));
		
		mav.setViewName("product/productpay");
		return mav;
		}else {
			System.out.println("로그인해");
			mav.setViewName("product/needlogin");
			
		}
		return mav;
	}
	
	@RequestMapping("productpay.do")
	public String productPayProcess( HttpServletRequest req ) {
	/*	UserDTO userdto = userService.loginCheck(userdto);
		System.out.println(userdto.getUsercode());*/
		HttpSession session = req.getSession();
		//System.out.println(session.getAttribute("loginOk").toString());
		
		if(session.getAttribute("loginOk") != null) {
			System.out.println("로그인 체크함");
			DealDTO dealdto = new DealDTO();
			String prod_code = req.getParameter("prod_code");
			int code = Integer.parseInt(prod_code);
			//System.out.println("번호 : "+prod_code);
			dealdto.setProd_code(code);
			//System.out.println(dealdto.getProd_code() + "마지막");
			int cnt = Integer.parseInt(req.getParameter("cnt"));
			System.out.println("수량: " +cnt);
			UserDTO dto = (UserDTO) session.getAttribute("loginOk");
			System.out.println(dto.getUsercode());
			dealdto.setDe_usercode(dto.getUsercode());
			dealdto.setProd_code(code);
			dealdto.setDe_cnt(cnt);
			productService.productDealProcess(dealdto);
			return "redirect:/main.do";
		}else {
			System.out.println("로그인해");
			return "product/needlogin";
		}
	}
	
	@RequestMapping("productProduce.do" )
	public String productProduce(HttpServletRequest req ) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginOk") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("loginOk");
			req.setAttribute("userdto", userdto);
			return "product/productProduce";
		}else {
			System.out.println("로그인해");
			return "product/needlogin";
		}
		
	}
	
	@RequestMapping(value="productProducePro.do" , method = RequestMethod.POST)
	public String productProducePro(HttpServletRequest req, ProductDTO prodto) {
		System.out.println("컨트롤러 오니?");
		HttpSession session = req.getSession();
		MultipartFile file = prodto.getUpload();
		
		if(!file.isEmpty()) {
			System.out.println("파일있음");
			String filename = file.getOriginalFilename();
			System.out.println("filename "+ filename); //filename test1.jpg
			UUID random = UUID.randomUUID();
			String root = "C:\\Users\\user1\\git\\final\\gofarm\\src\\main\\webapp\\product\\";
			System.out.println("root :"+ root); //root :C:\Lim\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gofarm\
			
			String saveDriectory = root+"images"+File.separator;
			File fe = new File(saveDriectory);
			File ff = new File(saveDriectory, random +"_"+filename);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			prodto.setPd_file(random+"_"+filename);
			
		}
		UserDTO udto =  (UserDTO) session.getAttribute("loginOk");
		System.out.println("유저코드(판매자) -"+udto.getUsercode());
		
		prodto.setUsercode(udto.getUsercode());
		productService.productInsertService(prodto);
		return "redirect:/productList.do";
	
	}
	@RequestMapping("productUpdate.do")
	public ModelAndView productUpdateForm(ModelAndView mav ,  int prod_code) {
		mav.addObject("pd_dto", productService.productViewProcess(prod_code));
		mav.setViewName("product/productUpdate");
		return mav;
	}
	
	@RequestMapping(value ="productUpdatePro.do" , method= RequestMethod.POST)
	public String productUpdatePro(HttpServletRequest req, ProductDTO prodto ,int prod_code) {
		System.out.println("컨트롤러 오니?");
		/*HttpSession session = req.getSession();
		MultipartFile file = prodto.getUpload();
		
		if(!file.isEmpty()) {
			System.out.println("파일있음");
			String filename = file.getOriginalFilename();
			System.out.println("filename "+ filename); //filename test1.jpg
			UUID random = UUID.randomUUID();
			String root = "C:\\Users\\user1\\git\\final\\gofarm\\src\\main\\webapp\\product\\";
			System.out.println("root :"+ root); //root :C:\Lim\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gofarm\
			
			String saveDriectory = root+"images"+File.separator;
			File fe = new File(saveDriectory);
			File ff = new File(saveDriectory, random +"_"+filename);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			prodto.setPd_file(random+"_"+filename);
			
		}else {
			prodto.setPd_file("null");
		}*/
		//UserDTO udto =  (UserDTO) session.getAttribute("loginOk");
		//System.out.println("유저코드(판매자) -"+udto.getUsercode());
		prodto.setProd_code(prod_code);
		//prodto.setUsercode(udto.getUsercode());
		productService.productUpdateService(prodto);
		return "redirect:/productList.do";
	}
	@RequestMapping("productDelete.do")
	public String productDeleteProcess(int prod_code) {
		productService.productDeleteService(prod_code);
		return "redirect:/productList.do";
	}
	
	
	
	
	
	
	
}
