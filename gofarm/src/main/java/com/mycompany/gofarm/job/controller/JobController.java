package com.mycompany.gofarm.job.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.job.service.RecruitService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class JobController {

	@Autowired
	private RecruitService recruitService;
	private int currentPage;
	private PageDTO pdto;

	public JobController() {

	}

	public void setService(RecruitService recruitService) {
		this.recruitService = recruitService;
	}

	// 구인 구직 카테고리
	@RequestMapping("/recruit2.do")
	public ModelAndView main_recruitgo(ModelAndView mav) {

		mav.addObject("aList", recruitService.job_listProcess());
		mav.addObject("aList2", recruitService.jobsearch_listProcess());

		mav.setViewName("job/recruit");
		
		return mav;

	}

	// 채용 정보 구인 리스트 페이지 ////////////////////////////////////////////////////
	@RequestMapping("/jobsearch.do")
	public ModelAndView listMethod(PageDTO pv, ModelAndView mav) {

		int totalRecord = recruitService.countProcess();

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			mav.addObject("aList", recruitService.listProcess(pdto));
		}
		mav.setViewName("job/joblist");
		System.out.println("채용상세 리스트 성공");
		return mav;
	}

	@RequestMapping("/view.do")
	public ModelAndView viewMethod(int currentPage, int job, ModelAndView mav) {
		System.out.println("뷰폼 입장");

		mav.addObject("dto", recruitService.contentProcess(job));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("job/resum");

		return mav;
	}

	// 근무자 모집 리스트 페이지//////////////////////////////////////
	@RequestMapping("/personsearch.do")
	public ModelAndView jobsearch_listMethod(PageDTO pv, ModelAndView mav) {
		System.out.println("드러왔나여");
		int totalRecord = recruitService.jobsearch_countProcess();
		System.out.println(totalRecord);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			System.out.println(pdto.getStartRow());
			System.out.println(pdto.getEndRow());

			mav.addObject("pd", pdto);
			mav.addObject("pList", recruitService.jobsearch_listProcess(pdto));
		}
		mav.setViewName("job/personlist");
		System.out.println("채용상세 리스트 성공");
		return mav;
	}

	@RequestMapping("/viewperson.do")
	public ModelAndView job_search_viewMethod(int currentPage, int jobsearchcode, ModelAndView mav, JobSearchDTO dto,
			HttpServletRequest req) {
		System.out.println("뷰폼2 입장");

		JobCheckDTO cdto = new JobCheckDTO();
		HttpSession session = req.getSession();
		session.getAttribute("loginOk");
		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		System.out.println(dto.getUsercode());
		cdto.setJk_usercode(dto.getUsercode());
		System.out.println("cdto" + cdto.getJk_usercode());

		mav.addObject("dto", recruitService.jobsearch_contentProcess(jobsearchcode));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("job/person_info");

		return mav;
	}

	// 인력 상세 페이지////////////////////////////////////////////////////
	@RequestMapping("/person_info.do")
	public String person_detail_info() {
		return "job/person_info";
	}

	// 채용글 폼 ////////////////////////////////////////////////////
	@RequestMapping("/personform.do")
	public String doGet4() {
		return "job/personform";
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/recruitform.do")
	public String doGet6(JobSearchDTO dto, HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		session.getAttribute("loginOk");

		return "job/recruitform2";
	}

	/*
	 * @RequestMapping("/list.do") public String doGet8() { return "job/personform";
	 * }
	 */

	///////////////////// 이력서 저장//////////////////////////
	// 이력서 insert
	// 이력서 insert
	@RequestMapping(value = "/resumeOK.do", method = RequestMethod.POST)
	public String doGet7(JobSearchDTO dto, HttpServletRequest req) {
		// 이력서 저장
		HttpSession session = req.getSession();
		session.getAttribute("loginOk");
		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		System.out.println(dto.getUsercode());
		recruitService.insert_resumeProcess(dto);

		// 경력 저장
		return "redirect:/jobsearch.do";
	}

}
