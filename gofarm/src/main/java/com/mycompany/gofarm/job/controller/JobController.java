package com.mycompany.gofarm.job.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mycompany.gofarm.board.service.FileUpload;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;

import com.mycompany.gofarm.job.service.RecruitService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class JobController {

	@Autowired
	private RecruitService recruitService;

	@Autowired
	private FileUpload fileUpload;

	@Autowired
	private JavaMailSender mailSender;

	public JobController() {

	}

	public void setService(RecruitService recruitService) {
		this.recruitService = recruitService;
	}

	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
	}

	// 구인 구직 카테고리
	@RequestMapping("/recruit2.do")
	public ModelAndView main_recruitgo(ModelAndView mav) {

		mav.addObject("aList", recruitService.job_listProcess());
		mav.addObject("aList2", recruitService.jobsearch_listProcess());
		mav.setViewName("job/recruit");

		return mav;
		// test
	}

	// 채용 정보 구인 리스트 페이지 ////////////////////////////////////////////////////
	@RequestMapping("/jobsearch.do")
	public ModelAndView listMethod(PageDTO pv, ModelAndView mav) {

		int totalRecord = recruitService.countProcess();
		// System.out.println("총 레코드수"+totalRecord);
		int currentPage = 0;
		PageDTO pdto = null;
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			// System.out.println("currpage: "+currentPage);
			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			mav.addObject("aList", recruitService.listProcess(pdto));
		}
		// System.out.println("채용글리스트: "+recruitService.listProcess(pdto).size());
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

	// 구직글 목록
	@RequestMapping("/personsearch.do")
	public ModelAndView jobsearch_listMethod(PageDTO pv, ModelAndView mav) {
		System.out.println("드러왔나여");
		int currentPage = 0;
		PageDTO pdto = null;
		int totalRecord = recruitService.jobsearch_countProcess();
		// System.out.println(totalRecord);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			// System.out.println(pdto.getStartRow());
			// System.out.println(pdto.getEndRow());

			mav.addObject("pd", pdto);
			mav.addObject("pList", recruitService.jobsearch_listProcess(pdto));
		}
		// System.out.println("구직글개수"+recruitService.jobsearch_listProcess(pdto).size());
		mav.setViewName("job/personlist");
		System.out.println("구직글 리스트 성공");
		return mav;
	}

	@RequestMapping("/viewperson.do")
	public ModelAndView job_search_viewMethod(int currentPage, int jobsearchcode, ModelAndView mav, JobSearchDTO dto,
			HttpServletRequest req, JobCheckDTO jdto) {

		HttpSession session = req.getSession();
		if ((session.getAttribute("loginOk")) == null) {

			mav.addObject("dto", recruitService.jobsearch_contentProcess(jobsearchcode));
			mav.addObject("currentPage", currentPage);
			mav.addObject("car", recruitService.careerlist(jobsearchcode));
			mav.setViewName("job/person_info");

			return mav;

		} else {
			jdto.setJk_usercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
			jdto.setJobsearchcode(jobsearchcode);

			int jcount = recruitService.chk(jdto); // 구인글 올린사람 체크
			int count = recruitService.view_chkProcess(jdto);
			int samecheck = recruitService.same_chkProcess(jdto);

			if (count == 0 && jcount == 1 && samecheck == 0) {

				mav.addObject("dto", recruitService.jobsearch_contentProcess(jobsearchcode));
				mav.addObject("currentPage", currentPage);
				mav.addObject("car", recruitService.careerlist(jobsearchcode));
				mav.setViewName("job/person_info");

				recruitService.insert_jobchkProcess(jdto);

				return mav;
			} else {

				mav.addObject("dto", recruitService.jobsearch_contentProcess(jobsearchcode));
				mav.addObject("currentPage", currentPage);
				mav.addObject("car", recruitService.careerlist(jobsearchcode));
				mav.setViewName("job/person_info");

				return mav;
			}
		}

		// System.out.println("count:" + recruitService.view_chkProcess(jdto));

	}

	// 채용글 폼 ////////////////////////////////////////////////////
	@RequestMapping("/personform.do")
	public String doGet4(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if ((session.getAttribute("loginOk")) == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		} else {

			int usercode = ((UserDTO) session.getAttribute("loginOk")).getUsercode();

			if (recruitService.jcountProcess(usercode) != 0) {
				res.setContentType("text/html; charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.println("<script>alert('이미 작성되었습니다'); history.go(-1);</script>");
				out.flush();
			}

		}
		return "job/personform";
	}

	@ResponseBody
	@RequestMapping(value = "/personform.do", method = RequestMethod.POST)
	public String uploadImage(MultipartFile file, HttpServletRequest request) throws Exception {
		String image_name = fileUpload.profileUpload(file, request);
		System.out.println("image_name: " + image_name);
		JsonObject obj = new JsonObject();

		obj.addProperty("image_name", image_name);
		System.out.printf("image_name2: ", image_name);

		return new Gson().toJson(obj);

	}

	// 채용글 받은거
	@RequestMapping(value = "/personformOK.do", method = RequestMethod.POST)
	public String doGet8(JobDTO dto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.getAttribute("loginOk");
		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		recruitService.insert_personProcess(dto);
		return "redirect:/recruit2.do";
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	// 구직 이력서
	// 폼//////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/recruitform.do")
	public String doGet6(JobSearchDTO dto, HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if ((session.getAttribute("loginOk")) == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		} else {

			int usercode = ((UserDTO) session.getAttribute("loginOk")).getUsercode();

			if (recruitService.jscountProcess(usercode) != 0) {
				res.setContentType("text/html; charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.println("<script>alert('이미 작성되었습니다.'); history.go(-1);</script>");
				out.flush();
			}

		}
		return "job/recruitform2";
	}

	/*
	 * @RequestMapping("/list.do") public String doGet8() { return "job/personform";
	 * }
	 */

	///////////////////// 이력서 저장//////////////////////////
	// 이력서 insert
	@RequestMapping(value = "/resumeOK.do", method = RequestMethod.POST)
	public String doGet7(JobSearchDTO dto, HttpServletRequest req) {
		// 이력서 저장
		HttpSession session = req.getSession();
		session.getAttribute("loginOk");
		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		recruitService.insert_resumeProcess(dto);
		/*
		 * for (CareerDTO cdto : dto.getList()) {
		 * System.out.println(cdto.getJobsearchcode());
		 * System.out.println(cdto.getCareer());
		 * System.out.println(cdto.getStartdate());
		 * System.out.println(cdto.getEnddate()); }
		 */

		// 경력 저장
		if (dto.getList() != null) {
			for (int i = 0; i < dto.getList().size(); i++) {
				dto.getList().get(i).setJobsearchcode(dto.getJobsearchcode());
			}
			recruitService.insert_careerProcess(dto.getList());
		}

		return "redirect:/recruit2.do";

	}

	@RequestMapping("/jobrequest.do")
	public String jobsendmail(HttpServletRequest req, int usercode, UserDTO dto) {
		System.out.println("구인글작성한사람 코드: " + usercode);
		//System.out.println(mailSender);
		String from = "gofarm16@gmail.com";
		String subject = "회원님의 구인글에 지원하신분의 정보입니다.";
		HttpSession session = req.getSession();
		dto = recruitService.getuserInfoProcess(usercode);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(dto.getEmail());
			messageHelper.setText("이름: " + ((UserDTO) session.getAttribute("loginOk")).getName() + "\n" + "이메일: "
					+ ((UserDTO) session.getAttribute("loginOk")).getEmail());

			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "redirect:/jobsearch.do";
	}

	// 채용글 수정
	@RequestMapping(value = "/updateview.do", method = RequestMethod.GET)
	public ModelAndView updateMethod(int job, int currentPage, ModelAndView mav) {
		mav.addObject("dto", recruitService.jobupdateSelectProcess(job));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("job/updateperson");
		return mav;
	}

	// 채용글 수정완료
	@RequestMapping(value = "/updateOK.do", method = RequestMethod.POST)
	public ModelAndView updateOK(JobDTO dto, int currentPage, ModelAndView mav) {
		recruitService.jobupdateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/jobsearch.do");
		return mav;
	}

	// 채용글 삭제
	@RequestMapping("/deleteview.do")
	public ModelAndView deleteMethod(int job, int currentPage, ModelAndView mav) {

		recruitService.jobdeleteProcess(job);
		PageDTO pv = new PageDTO(currentPage, recruitService.countProcess());
		if (pv.getTotalPage() <= currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else
			mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/jobsearch.do");
		return mav;
	}

	// 이력서 삭체
	@RequestMapping("/deleteviewperson.do")
	public ModelAndView pdeleteMethod(int jobsearchcode, int currentPage, ModelAndView mav) {

		recruitService.jsdeleteProcess(jobsearchcode);
		PageDTO pv = new PageDTO(currentPage, recruitService.jobsearch_countProcess());
		if (pv.getTotalPage() <= currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else
			mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/personsearch.do");
		return mav;
	}
}// end class
