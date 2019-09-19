package com.mycompany.gofarm.mypage.dto;

public class MyAuctionDTO {
	private String au_name;
	private String fin_time;
	private String name;
	private String user_home;
	private String phone;
	private int ctprice;
	private int state;
	private int auctioncode;
	
	public MyAuctionDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getAu_name() {
		return au_name;
	}

	public void setAu_name(String au_name) {
		this.au_name = au_name;
	}

	public String getFin_time() {
		return fin_time;
	}

	public void setFin_time(String fin_time) {
		this.fin_time = fin_time;
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

	public int getCtprice() {
		return ctprice;
	}

	public void setCtprice(int ctprice) {
		this.ctprice = ctprice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getAuctioncode() {
		return auctioncode;
	}

	public void setAuctioncode(int auctioncode) {
		this.auctioncode = auctioncode;
	}

}
