package com.mycompany.gofarm.mypage.dto;

import java.util.Date;

public class MySellDTO {
	private String pd_name;
	private String name;
	private String user_home;
	private String phone;
	private int de_cnt;
	private int prod_code;
	private Date de_date;
	
	public MySellDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUser_home() {
		return user_home;
	}

	public void setUser_home(String user_home) {
		this.user_home = user_home;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDe_cnt() {
		return de_cnt;
	}

	public void setDe_cnt(int de_cnt) {
		this.de_cnt = de_cnt;
	}

	public Date getDe_date() {
		return de_date;
	}

	public void setDe_date(Date de_date) {
		this.de_date = de_date;
	}

	public int getProd_code() {
		return prod_code;
	}

	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}

}
