package com.mycompany.gofarm.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.donation.dto.PageDTO;
import com.mycompany.gofarm.donation.service.DonationService;

@Controller
public class DonationController {
	@Autowired
	private DonationService donationService;
	
	private PageDTO pageDTO;
	
	private int currentPage;
	
	public void setDonationService(DonationService donationService) {
		this.donationService = donationService;
	}
	
	public DonationController() {
		// TODO Auto-generated constructor stub
	}
	//나눔 리스트 출력
	@RequestMapping("/donationList.do")
	public ModelAndView donationList(ModelAndView mav , PageDTO pv) {
		int totalRecord = donationService.countProcess();
		System.out.println("토탈 카운트 테스트 = "+ totalRecord);
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() ==0) {
				currentPage = 1;
			}else {
				currentPage = pv.getCurrentPage();
			}
			pageDTO = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv",pageDTO);
			mav.addObject("do_dto",donationService.donationListProcess(pageDTO));
		}
		
		mav.setViewName("donation/donationList");
		return mav;
	}
	
	
	
	//나눔 상세 페이지
	
	
	
	
	
}
