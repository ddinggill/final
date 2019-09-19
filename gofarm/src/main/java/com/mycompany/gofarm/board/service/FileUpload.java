package com.mycompany.gofarm.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileUpload {
	
	public String profileUpload(MultipartFile file, HttpServletRequest request) throws Exception;
	

}
