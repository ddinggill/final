package com.mycompany.gofarm.auction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
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
import com.mycompany.gofarm.auction.dto.MileageDTO;
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
		System.out.println("옥션코드"+ auctioncode);
		int usercode = auctionService.auctionSuccessfulProcess(auctioncode);
		
		List<Au_recipeDTO> aurelist = auctionService.auctionListProcess(auctioncode);
		System.out.println("경매자수:" + aurelist.size());
		for(Au_recipeDTO adto : aurelist) {
			adto.setNickname(auctionService.successfulUserProcess(adto.getBr_user()).getNickname());
		/*	System.out.println("경매자: "+adto.getNickname());
			System.out.println("날짜: "+adto.getBr_date());*/
		}
		mav.addObject("aurelist", aurelist);
		mav.addObject("user", auctionService.successfulUserProcess(usercode));
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
			go ="user/login";
			
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
			
			return "user/login";
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
	
	@RequestMapping("stateUpdate.do")
	public void auctionStateUpdate(int auctioncode) {
		System.out.println(auctioncode);
		auctionService.stateUpdeteProcess(auctioncode);
		//옥션 정보에 낙찰상태와 최종낙찰자 코드 추가
		//낙찰자 유저코드
		int usercode = auctionService.auctionSuccessfulProcess(auctioncode); 
		Au_recipeDTO rdto = new Au_recipeDTO();
		rdto.setAuctioncode(auctioncode);
		rdto.setBr_user(usercode);
		auctionService.finNameProcess(rdto);
		
		//경매 정보 가져오기
		AuctionDTO aucdto = auctionService.auctionViewProcess(auctioncode);
		
		//낙찰자 마일리지와 내역처리
		MileageDTO mdto = new MileageDTO();
		mdto.setUsercode(usercode); //낙찰자
		mdto.setM_list(-aucdto.getCtprice());//현재가 - 마일리지증감내역
		mdto.setM_content(aucdto.getAu_name()+"낙찰");//마일리지 증감내용
		
		//낙찰자 마일리지 감소 후  남은 마일리지 가져오기
		auctionService.auctionUserMileageminusProcess(aucdto);
		UserDTO userdto = auctionService.auctionTotalMileageProcess(usercode);
		mdto.setM_total(userdto.getMileage());
		
		//마일리지 내역에 낙찰자 마일리지 감소 내용 추가
		auctionService.mileageAddProcess(mdto);
		
		//판매자 유저코드
		int sellercode = aucdto.getUsercode();
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//판매자 마일리지 +
		auctionService.sellerMilPlusProcess(aucdto);
		
		//판매자 총마일리지 가져오기
		UserDTO sellerDto = auctionService.auctionTotalMileageProcess(sellercode);
		
		//판매자 마일리지 내역 기록을 위한 dto 세팅
		MileageDTO sellerMilDto = new MileageDTO();
		sellerMilDto.setUsercode(sellercode);//판매자 코드
		sellerMilDto.setM_list(aucdto.getCtprice());//현재가
		sellerMilDto.setM_total(sellerDto.getMileage());//현재 총 마일리지
		sellerMilDto.setM_content(aucdto.getAu_name()+"판매");//증감내용
		
		//판매자 마일리지 + 기록 남기기
		auctionService.mileageAddProcess(sellerMilDto);
		
	}

	
}
