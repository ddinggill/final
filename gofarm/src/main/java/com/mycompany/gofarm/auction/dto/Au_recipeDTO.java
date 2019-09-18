package com.mycompany.gofarm.auction.dto;



public class Au_recipeDTO {

	private int auctioncode;
	private int br_user;
	private int br_price;
	private String br_date;
	private String nickname;
	
	public Au_recipeDTO() {
		// TODO Auto-generated constructor stub
	}

	
	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getAuctioncode() {
		return auctioncode;
	}

	public void setAuctioncode(int auctioncode) {
		this.auctioncode = auctioncode;
	}

	public int getBr_user() {
		return br_user;
	}

	public void setBr_user(int br_user) {
		this.br_user = br_user;
	}

	public int getBr_price() {
		return br_price;
	}

	public void setBr_price(int br_price) {
		this.br_price = br_price;
	}

	public String getBr_date() {
		return br_date;
	}

	public void setBr_date(String br_date) {
		this.br_date = br_date;
	}
	
	
	
	
}
