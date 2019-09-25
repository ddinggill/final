package com.mycompany.gofarm.notice.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {

	private int noticecode, usercode;
	private String n_title;
	private String content;
	private String n_day;
	private String n_file;
	private int userlvl;
	private MultipartFile up_file;
	private String nickname;

	public NoticeDTO() {

	}
	
	

	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public int getUserlvl() {
		return userlvl;
	}

	public void setUserlvl(int userlvl) {
		this.userlvl = userlvl;
	}

	public MultipartFile getUp_file() {
		return up_file;
	}

	public void setUp_file(MultipartFile up_file) {
		this.up_file = up_file;
	}

	public int getNoticecode() {
		return noticecode;
	}

	public void setNoticecode(int noticecode) {
		this.noticecode = noticecode;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getN_day() {
		return n_day;
	}

	public void setN_day(String n_day) {
		this.n_day = n_day;
	}

	public String getN_file() {
		return n_file;
	}

	public void setN_file(String n_file) {
		this.n_file = n_file;
	}

}
