package com.mycompany.gofarm.mypage.controller;

import java.text.DateFormat;
import static javax.swing.JOptionPane.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MyAuctionDTO;
import com.mycompany.gofarm.mypage.dto.MyDonationDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.mypage.dto.myIndexCntDTO;
import com.mycompany.gofarm.mypage.service.MypageService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	public void setMypageService(MypageService mypageService) {
		this.mypageService = mypageService;
	}

	public MypageController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		myIndexCntDTO myCntDto = mypageService.myIndexCntService(user.getUsercode());
		List<MileageDTO> myDailyMileageDto = mypageService.myDailyMileageService(user.getUsercode());
		Gson dbchatgson = new Gson();
		String dbchatJson = dbchatgson.toJson(myDailyMileageDto);
		
		mav.addObject("myCnt_dto", myCntDto);  
		mav.addObject("alldata", dbchatJson);  
		mav.setViewName("mypage/myIndex");
		return mav;
	}
	
	@RequestMapping("/intro.do")
	public String intro() {
		return "mypage/intro";
	}
	
	@RequestMapping("/mileage.do")
	public ModelAndView mileage(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO) session.getAttribute("loginOk");
		mav.addObject("mileage_dto", mypageService.mileageListService(user.getUsercode()));
		mav.addObject("userDetail_dto", mypageService.userDetailViewService(user.getUsercode()));
		mav.setViewName("mypage/mileage");
		return mav;
	}
	
	@RequestMapping("/mileage_charge.do")
	public ModelAndView mileage_charge(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO) session.getAttribute("loginOk");
		UserDTO userDetail = mypageService.userDetailViewService(user.getUsercode());
		user.setUser_home(userDetail.getUser_home());
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String sysdate = dateFormat.format(date).toString();
		mav.addObject("sysdate", sysdate);
		mav.addObject("userDTO", user);
		mav.setViewName("mypage/mileage_charge");
		return mav;
	}
	
	@RequestMapping("/mileage_charge_end.do")
	public String mileage_charge_end(HttpSession session, ModelAndView mav, int m_list) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		UserDTO userDetail = mypageService.userDetailViewService(user.getUsercode());
		MileageDTO dto = new MileageDTO();
		dto.setUsercode(user.getUsercode());
		dto.setM_list(m_list);
		dto.setM_total(userDetail.getMileage()+m_list);
		dto.setM_content("마일리지 충전");
		mav.addObject("mileage_dto", dto);
		mypageService.mileageInsertService(dto);
		mypageService.mileageUpdateService(dto);
		return "redirect:/mileage.do";
	}
		
	@RequestMapping("/mileage_payment.do")
	public ModelAndView mileage_payment(ModelAndView mav) {
		mav.setViewName("mypage/mileage_payment");
		return mav;
	}
	
	@RequestMapping("/mileage_payment_end.do")
	public String mileage_payment_end(HttpSession session, ModelAndView mav, int m_list) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		UserDTO userDetail = mypageService.userDetailViewService(user.getUsercode());
		MileageDTO dto = new MileageDTO();
		dto.setUsercode(user.getUsercode());
		dto.setM_list(-m_list);
		dto.setM_total(userDetail.getMileage()-m_list);
		dto.setM_content("마일리지 출금");
		mav.addObject("mileage_dto", dto);
		mypageService.mileageInsertService(dto);
		mypageService.mileageUpdateService(dto);
		return "redirect:/mileage.do";
	}
	
	@RequestMapping("/paymentPorm.do")
	public ModelAndView paymentPro(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		UserDTO dto = mypageService.userDetailViewService(user.getUsercode());
		dto.setName(user.getName());
		mav.addObject("userDTO", dto);
		mav.setViewName("mypage/paymentPorm");
		return mav;
	}
	
	@RequestMapping("/paymentList.do")
	public ModelAndView paymentList(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		mav.addObject("mileage_dto", mypageService.paymentListService(user.getUsercode()));
		mav.setViewName("mypage/paymentList");
		return mav;
	}
	
	@RequestMapping("/jobView.do")
	public ModelAndView jobView(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		mav.addObject("job_dto", mypageService.jobListService(user.getUsercode()));
		mav.setViewName("mypage/job");
		return mav;
	}
	
	@RequestMapping("/jobSearchView.do")
	public ModelAndView jobSearchView(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO) session.getAttribute("loginOk");
		JobSearchDTO jobSearchDto = mypageService.jobSearchListService(user.getUsercode());
		System.out.println(mypageService.jobSearchListService(user.getUsercode()));
		try {
			List<JobDTO> jobCheckDto = mypageService.jobcheckListService(jobSearchDto.getJobsearchcode());
			mav.addObject("jobCheck_dto", jobCheckDto);
		} catch (NullPointerException e) {
			System.out.println("mypageService.jobcheckListService(jobSearchDto.getJobsearchcode()) = Null");
		}
		mav.addObject("jobSearch_dto", jobSearchDto);
		mav.setViewName("mypage/jobSearch");
		return mav;
	}
	
	@RequestMapping("/product.do")
	public ModelAndView product(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<MySellDTO> mySellDto = mypageService.mySellListService(user.getUsercode());
		mav.addObject("mySell_dto", mySellDto);
		mav.setViewName("mypage/product");
		return mav;
	}
	
	@RequestMapping("/myBuy.do")
	public ModelAndView myBuy(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<MySellDTO> myBuyDto = mypageService.myBuyListService(user.getUsercode());
		mav.addObject("myBuy_dto", myBuyDto);
		mav.setViewName("mypage/myBuy");
		return mav;
	}
	
	@RequestMapping("/myAuction.do")
	public ModelAndView myAuction(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<MyAuctionDTO> myAuctionDto = mypageService.myAuctionListService(user.getUsercode());
		mav.addObject("myAuction_dto", myAuctionDto);
		mav.setViewName("mypage/auction");
		return mav;
	}
	
	@RequestMapping("/myBid.do")
	public ModelAndView myBid(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<MyAuctionDTO> myBidDto = mypageService.myBidListService(user.getUsercode());
		mav.addObject("myBid_dto", myBidDto);
		mav.setViewName("mypage/myBid");
		return mav;
	}
	
	@RequestMapping("/myDonation.do")
	public ModelAndView myDonation(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<MyDonationDTO> myDonationDto = mypageService.myDonationListService(user.getUsercode());
		mav.addObject("myDonation_dto", myDonationDto);
		mav.setViewName("mypage/myDonation");
		return mav;
	}
	
	@RequestMapping("/myIndex.do")
	public ModelAndView myIndex(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		myIndexCntDTO myCntDto = mypageService.myIndexCntService(user.getUsercode());
		List<MileageDTO> myDailyMileageDto = mypageService.myDailyMileageService(user.getUsercode());
		mav.addObject("myCnt_dto", myCntDto);  
		mav.addObject("myDailyMileage_dto", myDailyMileageDto);  
		mav.setViewName("mypage/myIndex");
		return mav;
	}
	
	@RequestMapping("/myBoard.do")
	public ModelAndView myBoard(HttpSession session, ModelAndView mav) {
		UserDTO user = (UserDTO)session.getAttribute("loginOk");
		List<BoardDTO> myBoardDto = mypageService.myBoardListService(user.getUsercode());
		mav.addObject("myBoard_dto", myBoardDto);  
		mav.setViewName("mypage/myBoard");
		return mav;
	}
}
