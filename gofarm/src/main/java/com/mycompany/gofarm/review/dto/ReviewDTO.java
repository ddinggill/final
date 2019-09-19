package com.mycompany.gofarm.review.dto;

public class ReviewDTO {

	private int re_code;
	private int prod_code;
	private int re_user;
	private int re_star;
	private String re_title;
	private String content;
	private String re_file;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getRe_code() {
		return re_code;
	}

	public void setRe_code(int re_code) {
		this.re_code = re_code;
	}

	public int getProd_code() {
		return prod_code;
	}

	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}

	public int getRe_user() {
		return re_user;
	}

	public void setRe_user(int re_user) {
		this.re_user = re_user;
	}

	public int getRe_star() {
		return re_star;
	}

	public void setRe_star(int re_star) {
		this.re_star = re_star;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRe_file() {
		return re_file;
	}

	public void setRe_file(String re_file) {
		this.re_file = re_file;
	}
	
	
	
	
}
