package com.mycompany.gofarm.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.mycompany.gofarm.board.dao.BoardDAO;



//다운로드 창을 띄우기 위한 뷰페이지
@Service
public class BoardDownLoadView  extends AbstractView{
	@Autowired
	private BoardDAO dao;
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int boardcode=Integer.parseInt(request.getParameter("boardcode"));
		System.out.println(boardcode +" -보드코드");
		//System.out.println(num);		
		//System.out.println(model.get("num"));
		
		String saveDirectory = request.getSession().getServletContext().getRealPath("profileUpload");
		// root+"temp/"
		//String saveDirectory = root + "temp" + File.separator;
		
		String upload=dao.getFile(boardcode);
		//String fileName=upload.substring(upload.indexOf("_")+1);
		
		//파일명이 한글일때 인코딩 작업을 한다.
		String str=URLEncoder.encode(upload,"UTF-8");
		
		//원본파일명에서 공백이 있을 때  +로 표시가 되므로 공백으로 처리해줌
		str=str.replaceAll("\\+", "%20");
		
		//컨텐트 타입
		response.setContentType("application/octet-stream");
		
		//다운로드창에 보여줄 파일명을 지정한다.
		response.setHeader("Content-Disposition",
						    "attachment;filename="+str+";");
		
		//서버에 저장된 파일을 읽어와 클라이언트에 출력해 준다.
				FileCopyUtils.copy(new FileInputStream(
						new File(saveDirectory,upload)),
						response.getOutputStream());
		
	}//end renderMergedOutputb()
	
	
}//end class






