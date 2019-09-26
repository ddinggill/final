package com.mycompany.gofarm.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.service.BoardDownLoadView;
import com.mycompany.gofarm.board.service.BoardService;
import com.mycompany.gofarm.board.service.FileUpload;
import com.mycompany.gofarm.job.service.RecruitService;
import com.mycompany.gofarm.board.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@CrossOrigin("*")
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardDownLoadView boardDownLoadView;
	
	public void setBoardDownLoadView(BoardDownLoadView boardDownLoadView) {
		this.boardDownLoadView = boardDownLoadView;
	}
	
	@Autowired
	private FileUpload fileUpload;

	public BoardController() {

	}

	public void setService(BoardService boardService) {
		this.boardService = boardService;
	}

	public void setFileUpload(FileUpload fileUpload) {
		this.fileUpload = fileUpload;
	}

	// 게시판 메인 화면
	@RequestMapping("/board.do")
	public String main_index() {

		return "board/boardindex";
	}

	// 게시판-구인구직
	@RequestMapping("/board_job.do")
	public ModelAndView bjob(PageDTO pv, ModelAndView mav) {

		String go = "구인구직";
		int totalRecord = boardService.boardcount(go);
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
			pdto.setB_category("구인구직");
			mav.addObject("pv", pdto);
			mav.addObject("aList", boardService.boardlistProcess(pdto));
			mav.addObject("category", go);
		}
		// System.out.println("채용글리스트: "+recruitService.listProcess(pdto).size());
		mav.setViewName("board/boardlist");

		return mav;
	}

	// 게시판-판매경매
	@RequestMapping("/board_trade.do")
	public ModelAndView bsale(PageDTO pv, ModelAndView mav) {

		String go = "판매경매";
		int totalRecord = boardService.boardcount(go);
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
			pdto.setB_category("판매경매");
			mav.addObject("pv", pdto);
			mav.addObject("aList", boardService.boardlistProcess(pdto));
			mav.addObject("category", go);
		}
		// System.out.println("채용글리스트: "+recruitService.listProcess(pdto).size());
		mav.setViewName("board/boardlist");

		return mav;
	}

	// 게시판-나눔
	@RequestMapping("/board_shard.do")
	public ModelAndView bshare(PageDTO pv, ModelAndView mav) {

		String go = "나눔";
		int totalRecord = boardService.boardcount(go);
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
			pdto.setB_category("나눔");
			mav.addObject("pv", pdto);
			mav.addObject("aList", boardService.boardlistProcess(pdto));
			mav.addObject("category", go);
		}
		// System.out.println("채용글리스트: "+recruitService.listProcess(pdto).size());
		mav.setViewName("board/boardlist");

		return mav;
	}

	// 게시판-수다
	@RequestMapping("/board_talk.do")
	public ModelAndView btalk(PageDTO pv, ModelAndView mav) {

		String go = "사담";
		int totalRecord = boardService.boardcount(go);
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
			pdto.setB_category("사담");
			mav.addObject("pv", pdto);
			mav.addObject("aList", boardService.boardlistProcess(pdto));
			mav.addObject("category", go);
		}
		// System.out.println("채용글리스트: "+recruitService.listProcess(pdto).size());
		mav.setViewName("board/boardlist");

		return mav;
	}
	/*
	 * //댓글보여지는 창
	 * 
	 * @RequestMapping(value = "/cview.do") public ModelAndView boardViewPage(int
	 * boardcode) {
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("boardDTO",
	 * boardService.boardViewProcess(boardcode)); mav.setViewName("boardView");
	 * return mav; }
	 */

	@RequestMapping("/reply.do")
	public String reply_view() {
		return "board/comment";
	}

	// 댓글 insert
	@RequestMapping("/cinsertList.do")
	public @ResponseBody List<CommentsDTO> cList(CommentsDTO rdto, int boardcode, HttpServletRequest req) {
		System.out.println("댓글 insert컨트롤러");
		HttpSession session = req.getSession();
		rdto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());
		rdto.setBoardcode(boardcode);
		return boardService.replyListProcess(rdto);
	}

	// 댓글 update
	@RequestMapping("/cUpdate.do")
	public @ResponseBody List<CommentsDTO> cUpdate(CommentsDTO rdto, int commentcode, String content,
			HttpServletRequest req) {
		System.out.println("댓글 update컨트롤러");

		HttpSession session = req.getSession();
		rdto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());

		rdto.setCommentcode(commentcode);
		rdto.setContent(content);

		return boardService.replyUpProcess(rdto);
	}

	// 댓글 delete
	@RequestMapping("/cDelate.do")
	public @ResponseBody void cDelete(int commentcode, HttpServletRequest req) {
		System.out.println("코멘트번호" + commentcode);
		boardService.replyDelProcess(commentcode);

	}
	////////////////////// 게시판
	////////////////////// 작성///////////////////////////////////////////////////////

	@RequestMapping("/writeform.do")
	public ModelAndView doGet4(HttpServletRequest req, HttpServletResponse res, String category, ModelAndView mav) throws IOException {
		HttpSession session = req.getSession();

		if ((session.getAttribute("loginOk")) == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		}
		mav.addObject("category",category);
		mav.setViewName("board/writeform");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/writeform.do", method = RequestMethod.POST)
	public String uploadImage(MultipartFile file, HttpServletRequest request) throws Exception {
		String image_name = fileUpload.profileUpload(file, request);
		System.out.println("image_name: " + image_name);
		JsonObject obj = new JsonObject();

		obj.addProperty("image_name", image_name);
		System.out.printf("image_name2: ", image_name);

		return new Gson().toJson(obj);

	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(BoardDTO dto, HttpServletRequest req, HttpServletResponse res, HttpServletRequest request)
			throws Exception {
		HttpSession session = req.getSession();
		MultipartFile file = dto.getUp_file();

		System.out.println("파일 들어감?: " + dto.getUp_file());

		if (!file.isEmpty()) {
			System.out.println("파일있음");
			String filename = fileUpload.profileUpload(file, req);
			dto.setB_file(filename);

		}

		session.getAttribute("loginOK");
		dto.setUsercode(((UserDTO) session.getAttribute("loginOk")).getUsercode());

		System.out.println("보드 들어갔는지 확인 1");
		System.out.println(dto.getUsercode());
		boardService.insert_boardProcess(dto);

		System.out.println("보드 들어갔는지 확인 2");

		return "redirect:/board.do";
	}

	@RequestMapping("/board_view.do")
	public ModelAndView main22_index(int currentPage, int boardcode, ModelAndView mav, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		/*HttpSession session = req.getSession();

		if ((session.getAttribute("loginOk")) == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		}*/
		System.out.println("자유게시판 상세뷰 입장");
		mav.addObject("dto", boardService.contentProcess(boardcode));
		mav.addObject("cdto", boardService.commentList(boardcode));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board/boardview");
		return mav;
	}

	@RequestMapping(value = "/board_up.do", method = RequestMethod.GET)
	public ModelAndView board_updateMethod(int boardcode, int currentPage, ModelAndView mav) {

		mav.addObject("dto", boardService.updatenumProcess(boardcode));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board/boardupdate");

		return mav;

	}

	@RequestMapping(value = "/board_up.do", method = RequestMethod.POST)
	public ModelAndView updatecont(BoardDTO dto, int currentPage, HttpServletRequest request, ModelAndView mav) throws Exception {
		// 기존 첨부파일

		System.out.println("업뎃 입장");
		System.out.println("보드코드: " + dto.getBoardcode());
		System.out.println("테스트" + boardService.fileSelectProcess(dto.getBoardcode()));
		String filename = boardService.fileSelectProcess(dto.getBoardcode());
		System.out.println("upload: " + dto.getUp_file());
		System.out.println("filename" + filename);
		String saveDirectory = request.getSession().getServletContext().getRealPath("profileUpload");

		// 수정할 첨부파일
		MultipartFile file = dto.getUp_file();

		System.out.println("file" + file);
		// 수정할 첨부파일이 있으면
		if (!file.isEmpty()) {
			// 기존 첨부파일이 있으면....
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}
			String fileName = fileUpload.profileUpload(file, request);
			dto.setB_file(fileName);
		}
		boardService.bupdateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/board.do");
		return mav;

	}

	@RequestMapping(value = "/board_del.do")
	public ModelAndView delete(int boardcode, int currentPage, HttpServletRequest request, ModelAndView mav) {

		System.out.println("삭제 입장");
		String up_file = boardService.fileSelectProcess(boardcode);
		System.out.println("삭ㅈ ㅔ up_file" + up_file);
		if (up_file != null) {
			String saveDirectory = request.getSession().getServletContext().getRealPath("profileUpload");
			File fe = new File(saveDirectory, up_file);
			fe.delete();

		}
		System.out.println("upfile2: " + up_file);
		System.out.println(boardcode);

		boardService.bdeleteProcess(boardcode);

		System.out.println("3: ");
		PageDTO pv = new PageDTO(currentPage, boardService.countProcess());

		System.out.println(pv.getCurrentPage());
		if (pv.getTotalPage() <= currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		} else
			mav.addObject("currentPage", currentPage);

		mav.setViewName("redirect:/board.do");
		return mav;
	}
	
	@RequestMapping("download.do")
	public void downMethod(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		
		boardDownLoadView.renderMergedOutputModel(null, req, res);
	}

}
