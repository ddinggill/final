package com.mycompany.gofarm.mypage.dto;

public class MyDonationDTO {
	private String do_product;
	private int do_cnt;
	private int docode;
	private int app_cnt;
	
	public MyDonationDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getDo_product() {
		return do_product;
	}

	public void setDo_product(String do_product) {
		this.do_product = do_product;
	}

	public int getDo_cnt() {
		return do_cnt;
	}

	public void setDo_cnt(int do_cnt) {
		this.do_cnt = do_cnt;
	}

	public int getDocode() {
		return docode;
	}

	public void setDocode(int docode) {
		this.docode = docode;
	}

	public int getApp_cnt() {
		return app_cnt;
	}

	public void setApp_cnt(int app_cnt) {
		this.app_cnt = app_cnt;
	}
	
}
