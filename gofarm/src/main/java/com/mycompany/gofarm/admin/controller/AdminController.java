package com.mycompany.gofarm.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public AdminController() {
		// TODO Auto-generated constructor stub
	}
	
	//유저 목록 리스트
	@RequestMapping("adminUserList.do")
	public ModelAndView adminUserList(ModelAndView mav) {
		
		mav.addObject("user", adminService.adminUserListProcess());
		mav.setViewName("admin/admin_user");
		return mav;
	}
	
	
	//유저삭제
	@RequestMapping("adminUserDelete.do")
	public ModelAndView adminUserDelete(ModelAndView mav , int usercode) {
		adminService.adminUserDeleteProcess(usercode);
		mav.setViewName("redirect:/adminUserList.do");
		return mav;
	}
	//판매목록
	@RequestMapping("adminProductList.do")
	public ModelAndView adminProductList(ModelAndView mav) {
		mav.addObject("product", adminService.adminProductListProcess());
		mav.setViewName("admin/admin_product");
		return mav;
	}
		
	//판매삭제
	@RequestMapping("adminProductDelete.do")
	public ModelAndView adminProductDelete(ModelAndView mav , int prod_code) {
		adminService.adminProductDeleteProcess(prod_code);
		mav.setViewName("redirect:/adminProductList.do");
		return mav;
	}
	
	//경매 목록
	@RequestMapping("adminAuctionList.do")
	public ModelAndView adminAuctionList(ModelAndView mav) {
		mav.addObject("auction", adminService.adminAuctionListProcess());
		mav.setViewName("admin/admin_auction");
		return mav;
	}
	
	//나눔 목록
	@RequestMapping("adminDonationList.do")
	public ModelAndView adminDonationList(ModelAndView mav) {
		mav.addObject("donation", adminService.adminDonationListProcess());
		mav.setViewName("admin/admin_donation");
		return mav;
	}
	//나눔 삭제
	@RequestMapping("adminDonationDelete.do")
	public ModelAndView adminDonationDelete(ModelAndView mav , int docode) {
		adminService.adminDonationDeleteProcess(docode);
		mav.setViewName("redirect:/adminDonationList.do");
		return mav;
	}
	
	
	//구인목록 
	@RequestMapping("adminJobList.do")
	public ModelAndView adminJobList(ModelAndView mav) {
		mav.addObject("job", adminService.adminJobListProcess());
		mav.setViewName("admin/admin_job");
		return mav;
	}
	//구인 삭제
	@RequestMapping("adminJobDelete.do")
	public ModelAndView adminJobDelete(ModelAndView mav , int job) {
		adminService.adminJobDeleteProcess(job);
		mav.setViewName("redirect:/adminJobList.do");
		return mav;
	}
	//구직 목록
	@RequestMapping("adminJobsearchList.do")
	public ModelAndView adminSearchList(ModelAndView mav) {
		mav.addObject("jobsearch", adminService.adminJobsearchListProcess());
		mav.setViewName("admin/admin_jobsearch");
		return mav;
	}
	//구직 삭제
	@RequestMapping("adminJobserachDelete.do")
	public ModelAndView adminJobsearchDelete(ModelAndView mav , int jobsearchcode) {
		adminService.adminJobserachDeleteProcess(jobsearchcode);
		mav.setViewName("redirect:/adminJobsearchList.do");
		return mav;
	
	}
	
	
	//마일리지 충전 목록
	@RequestMapping("adminMileageChargeList.do")
	public ModelAndView adminMileageChargeList(ModelAndView mav) {
		mav.addObject("mileage", adminService.adminMileageChargeListProcess());
		mav.setViewName("admin/admin_mileageCh");
		return mav;
	}
	
	
	
	//마일리지 출금 목롣
	@RequestMapping("adminMileagePaymentList.do")
	public ModelAndView adminMileagePaymentList(ModelAndView mav) {
		mav.addObject("mileage", adminService.adminMileagePaymentListProcess());
		mav.setViewName("admin/admin_mileagePay");
		return mav;
	}
	
	//게시글 목록
	@RequestMapping("adminBoardList.do")
	public ModelAndView adminBoardList(ModelAndView mav) {
		mav.addObject("board", adminService.adminBoardListProcess());
		mav.setViewName("admin/admin_board");
		return mav;
	}
	//게시글 삭제
	@RequestMapping("adminBoardDelete.do")
	public ModelAndView adminBoardDelete(ModelAndView mav , int boardcode) {
		adminService.adminBoardDeleteProcess(boardcode);
		mav.setViewName("redirect:/adminBoardList.do");
		return mav;
	}
	
	//진행중 채팅방 목록 
	@RequestMapping("adminChatRoomList.do")
	public ModelAndView adminChatRoomList(ModelAndView mav) {
		mav.addObject("chat", adminService.adminChatRoomListProcess());
		mav.setViewName("admin/admin_chat");
		return mav;
	}
	//채팅방 삭제
	@RequestMapping("adminChatRoomDelete.do")
	public ModelAndView adminChatRoomDelete(ModelAndView mav , int chatcode) {
		adminService.adminChatRoomDeleteProcess(chatcode);
		mav.setViewName("redirect:/adminChatRoomList.do");
		return mav;
	}
	
	
	
	
	
	
}
