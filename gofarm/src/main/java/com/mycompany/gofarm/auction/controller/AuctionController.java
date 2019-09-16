package com.mycompany.gofarm.auction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.auction.service.AuctionService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class AuctionController {
	
	
	@Autowired
	private AuctionService auctionService;
	
	private int currentPage;
	
	private PageDTO pageDTO;
	
	public void setAuctionService(AuctionService auctionService) {
		this.auctionService = auctionService;
	}
	
	public AuctionController() {
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("/auctionList.do")
	public ModelAndView auctionList(ModelAndView mav , PageDTO pv) {
		System.out.println("auc test");
		int totalRecord = auctionService.countProcess();
		System.out.println("asas"+ totalRecord);
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() ==0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
			pageDTO = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv",pageDTO);
			mav.addObject("au_dto", auctionService.auctionListService(pageDTO));
		}
		
		

		
		mav.setViewName("auction/auctionList");
		return mav;
	}
	
	@RequestMapping("auctionView.do")
	public ModelAndView auctionSingleView(ModelAndView mav , int auctioncode ,
			int currentPage, HttpServletRequest req ) {
		AuctionDTO dto = auctionService.auctionViewProcess(auctioncode);
		
		HttpSession session = req.getSession();
		if(session.getAttribute("loginOk") != null) {
			UserDTO user = (UserDTO) session.getAttribute("loginOk");
			mav.addObject("user", user);
		}		
		
		
		mav.addObject("dto", dto);
		mav.setViewName("auction/auction-single");
		
		return mav;
	}
	@RequestMapping("auctionRecipe.do")
	public String auctionRecipe(int auctioncode ,int price, HttpServletRequest req ) {
		String go = "";
		HttpSession session = req.getSession();
		if(session.getAttribute("loginOk") != null) {
			UserDTO udto = (UserDTO) session.getAttribute("loginOk");
			Au_recipeDTO au_dto = new Au_recipeDTO();
			au_dto.setAuctioncode(auctioncode);
			au_dto.setBr_price(price);
			au_dto.setBr_user(udto.getUsercode());
			auctionService.au_recipeInsertProcess(au_dto);
			go = "redirect:/auctionList.do";
			
		}else {
			System.out.println("로그인 필요");
			go ="redirect:/auctionList.do";
			
		}
		
		
		
		return go;
	}
	
	
	@RequestMapping("AuctionProduce.do")
	public String auctionProduce(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("loginOk") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("loginOk");
			req.setAttribute("userdto", userdto);
			return "auction/auctionProduce";
		}else {
			
			return "UserController/login.do";
		}
	}
	@RequestMapping(value="AuctionProduce.do" , method = RequestMethod.POST)
	public String auctionProducePro(HttpServletRequest req , AuctionDTO adto) {
		
		HttpSession session = req.getSession();
		MultipartFile file = adto.getUpload();
		
		if(!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			UUID random = UUID.randomUUID();
			String root = "C:\\Users\\user1\\git\\final\\gofarm\\src\\main\\webapp\\auction\\";
			String saveDrectory = root + "images" + File.separator;
			File fe = new File(saveDrectory);
			File ff = new File(saveDrectory, random+"_"+filename);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			adto.setAu_file(random+"_"+filename);
		}
		
		UserDTO udto = (UserDTO) session.getAttribute("loginOk");
		System.out.println(udto.getUsercode());
		adto.setUsercode(udto.getUsercode());
		System.out.println(adto.getFin_time());
		String fintime = adto.getFin_time();
		fintime += ":00";
		System.out.println(fintime);
		adto.setFin_time(fintime);
		auctionService.auctionInsertProcess(adto);
		
		return "redirect:/auctionList.do";
	}
	
	
	
}
