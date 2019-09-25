package com.mycompany.gofarm.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.notice.dto.NoticeDTO;
import com.mycompany.gofarm.notice.dto.PageDTO;
import com.mycompany.gofarm.notice.service.NoticeService;
import com.mycompany.gofarm.user.dto.UserDTO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {

	}

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@RequestMapping("/notice.do")
	public ModelAndView notice_list(PageDTO pv, ModelAndView mav, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.getAttribute("loginOk");

		int currentPage = 0;
		PageDTO pdto = null;
		int totalRecord = noticeService.n_countProcess();

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
			mav.addObject("pList", noticeService.notice_listProcess(pdto));
		}
		mav.setViewName("notice/noticelist");
		return mav;

	}

	@RequestMapping("/notice_view.do")
	public ModelAndView notice_view(int currentPage, int noticecode, ModelAndView mav) {

		mav.addObject("dto", noticeService.notice_contProcess(noticecode));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("notice/noticeview");

		return mav;

	}

	@RequestMapping("/notice_write.do")
	public String norice_write(NoticeDTO dto, HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if ((session.getAttribute("loginOk")) == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		}
		return "notice/noticewrite";
	}

	@RequestMapping(value = "/writeOK.do", method = RequestMethod.POST)
	public String writeOK(NoticeDTO dto, HttpServletRequest req, HttpServletResponse res, HttpServletRequest request)
			throws IOException {
		// 이력서 저장
		HttpSession session = req.getSession();
		MultipartFile file = dto.getUp_file();

		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			System.out.println("확인:" + filename);
			UUID random = UUID.randomUUID();
			String root = "C:\\";
			String saveDrectory = root + "temp" + File.separator;
			System.out.println("save: " + saveDrectory);
			File fe = new File(saveDrectory);
			File ff = new File(saveDrectory, random + "_" + filename);

			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setN_file(random + "_" + filename);
		}
		session.getAttribute("loginOK");

		System.out.println(((UserDTO) session.getAttribute("loginOk")).getEmail());

		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		/*
		 * if (dto.getN_file() == null) { dto.setN_file(null);
		 * noticeService.notice_insertProcess(dto); return "redirect:/notice.do"; }
		 */
		noticeService.notice_insertProcess(dto);
		return "redirect:/notice.do";

	}

	@RequestMapping(value = "notice_del.do")
	public ModelAndView delete(int noticecode, int currentPage, HttpServletRequest request, ModelAndView mav) {

		String up_file = noticeService.fileSelectProcess(noticecode);

		if (up_file != null) {
			String root = "C:\\";
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory, up_file);
			fe.delete();

		}
		System.out.println("upfile2: " + up_file);
		System.out.println(noticecode);

		noticeService.bdeleteProcess(noticecode);

		PageDTO pv = new PageDTO(currentPage, noticeService.n_countProcess());

		System.out.println(pv.getCurrentPage());
		if (pv.getTotalPage() <= currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		} else
			mav.addObject("currentPage", currentPage);

		mav.setViewName("redirect:/notice.do");
		return mav;
	}

}
