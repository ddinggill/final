package com.mycompany.gofarm.donation.dto;

import org.springframework.web.multipart.MultipartFile;

public class DonationDTO {

	private int docode;
	private int usercode;
	private String do_file;
	private String do_product;
	private String content;
	private int do_cnt;
	
	private MultipartFile upload;
	
	public DonationDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getDocode() {
		return docode;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}


	public void setDocode(int docode) {
		this.docode = docode;
	}


	public int getUsercode() {
		return usercode;
	}


	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}


	public String getDo_file() {
		return do_file;
	}


	public void setDo_file(String do_file) {
		this.do_file = do_file;
	}


	public String getDo_product() {
		return do_product;
	}


	public void setDo_product(String do_product) {
		this.do_product = do_product;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getDo_cnt() {
		return do_cnt;
	}


	public void setDo_cnt(int do_cnt) {
		this.do_cnt = do_cnt;
	}
	
	
	
	
	
}
