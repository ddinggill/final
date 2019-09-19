package com.mycompany.gofarm.donation.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateTimeFormatAnnotationFormatterFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.donation.dto.Do_conditionDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;
import com.mycompany.gofarm.donation.service.DonationService;
import com.mycompany.gofarm.user.dto.UserDTO;

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
	@RequestMapping("donationView.do")
	public ModelAndView donationView(ModelAndView mav , int docode , int currentPage 
			, HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("loginOk") != null) {
			UserDTO user = (UserDTO) session.getAttribute("loginOk");
			mav.addObject("user", user);
		
		}
		//유저코드로 판매자 이름을 출력
		DonationDTO dodto = donationService.donationViewProcess(docode);
		UserDTO userdto= donationService.userInfoProcess(dodto.getUsercode());
		
		
		//나눔글 정보와 나눔신청 현황을 보냄
		//나눔글의 정보를 가져옴
		mav.addObject("do_dto", donationService.donationViewProcess(docode));
		//나눔코드를 이용해 나눔 신청현황을 가져옴
		mav.addObject("condition", donationService.do_conditionListProcess(docode));
		mav.addObject("userdto", userdto);
		mav.setViewName("donation/donationView");
		return mav;
	}
	
	//나눔글 작성폼 이동
	@RequestMapping("donationProduce.do")
	public String donationProduce(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginOk") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("loginOk");
			req.setAttribute("userdto", userdto);
			return "donation/donationProduce";
		}else {
			
			return "user/login";
		}
		
	}
	
	//나눔글 등록
	@RequestMapping(value= "donationProducePro.do" , method = RequestMethod.POST )
	public String donationProducePro(HttpServletRequest req , DonationDTO dodto) {
		
		HttpSession session = req.getSession();
		MultipartFile file = dodto.getUpload();
		
		if(!file.isEmpty()) {
			System.out.println("파일있음");
			String filename = file.getOriginalFilename();
			System.out.println("filename "+ filename); //filename test1.jpg
			UUID random = UUID.randomUUID();
			String root = "C:\\Users\\user1\\git\\final\\gofarm\\src\\main\\webapp\\donation\\";
			System.out.println("root :"+ root); //root :C:\Lim\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gofarm\
			
			String saveDriectory = root+"images"+File.separator;
			File fe = new File(saveDriectory);
			File ff = new File(saveDriectory, random +"_"+filename);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			dodto.setDo_file(random +"_"+filename);
		}
		
		UserDTO udto = (UserDTO) session.getAttribute("loginOk");
		
		dodto.setUsercode(udto.getUsercode());
		donationService.donationProduceProcess(dodto);
		return "redirect:/donationList.do";
	}
	
	//나눔글 수정폼 이동
	@RequestMapping("donationUpdate.do")
	public ModelAndView donationUpdateForm(ModelAndView mav , int docode) {
		//나눔코드로 정보를 가져옴
		mav.addObject("dodto", donationService.donationViewProcess(docode));
		mav.setViewName("donation/donationUpdate");
		return mav;
	}
	//나눔글 수정
	@RequestMapping(value = "donationUpdate.do" , method = RequestMethod.POST)
	public String donationUpdatePro(HttpServletRequest req , DonationDTO dodto , int docode) {
		dodto.setDocode(docode);
		donationService.donationUpdateProcess(dodto);
		return "redirect:/donationList.do";
	}
	
	//나눔글 삭제
	@RequestMapping("donationDelete.do")
	public String donationDelete(int docode) {
		donationService.donationDeleteProcess(docode);
		return "redirect:/donationList.do";
	}
	//신청하기 버튼 클릭시 
	@RequestMapping("donationRequest.do")
	public String donationRequest(HttpServletRequest req ,int docode  ) {
		HttpSession session = req.getSession();
		//로그인 안하면 로그인 페이지로 이동
		if (session.getAttribute("loginOk") != null){
			UserDTO userdto = (UserDTO) session.getAttribute("loginOk");
			
			//나눔신청현황에 담아서 데이터 저장
			Do_conditionDTO condto = new Do_conditionDTO();
			condto.setDo_name(userdto.getUsercode());
			condto.setDocode(docode);
			condto.setPhoneNumber(userdto.getPhone());
			condto.setUsername(userdto.getName());
			//저장
			donationService.donationRequestProcess(condto);
			return "redirect:/donationList.do";
		}else {
			return "user/login";
		}
	}
	
	
	//신청하기 클릭시 기존에 신청하기를 하였는지 알아낸다.
	@RequestMapping(value =  "donationReqCheck.do" , method = RequestMethod.GET)
	public @ResponseBody boolean donationReqCheck(int docode , HttpServletRequest req) {
		System.out.println("들어는 오니?");
		HttpSession session = req.getSession();
		UserDTO userdto = (UserDTO) session.getAttribute("loginOk");
		List<Do_conditionDTO> aList =  donationService.do_conditionListProcess(docode);
		boolean res = true;
		System.out.println("나눔코드"+ docode);
		try {
		for(int i =0; i < aList.size();i++) {
			
			if(aList.get(i).getDocode() == docode ) {
				System.out.println("찍히니?"+aList.get(i).getDo_name());
				
				if(aList.get(i).getDo_name() == userdto.getUsercode()) {
					res= false;
				}
			}else {
				res= true;
			}
			
		}
		}catch (NullPointerException e) {
			System.out.println(e.toString());
			System.out.println("로그임 안됨으로 오류처리");
			
		}
		return res;
	}
	
	//나눔버튼 클릭시 나눔상태 변경 및 남은 수량 감소
	@RequestMapping("donationReqState.do")
	public String donationReqState(int docode , int do_name) {
		
		
		System.out.println("신청자코드"+ do_name);
		System.out.println("작성자코드"+docode);
		Do_conditionDTO condto = new Do_conditionDTO();
		condto.setDocode(docode);
		condto.setDo_name(do_name);
		
		//신청 테이블 상태 변경
		donationService.do_conditionStateUpdMethod(condto);
		
		//나눔 테이블 수량 감소
		donationService.donationCntProcess(docode);
		
		
		
		
		return "redirect:/donationList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
}
