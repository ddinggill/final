package com.mycompany.gofarm.auction.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AuctionDTO {

	private int auctioncode;
	private int usercode;
	private String au_name;
	private String au_file;
	private int ctprice;
	private int stprice;
	private String fin_name;
	private int state;
	private String st_time;
	private String fin_time;
	private String content;
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public AuctionDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getAuctioncode() {
		return auctioncode;
	}
	public void setAuctioncode(int auctioncode) {
		this.auctioncode = auctioncode;
	}
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public String getAu_name() {
		return au_name;
	}
	public void setAu_name(String au_name) {
		this.au_name = au_name;
	}
	
	public String getAu_file() {
		return au_file;
	}
	public void setAu_file(String au_file) {
		this.au_file = au_file;
	}
	public int getCtprice() {
		return ctprice;
	}
	public void setCtprice(int ctprice) {
		this.ctprice = ctprice;
	}
	public int getStprice() {
		return stprice;
	}
	public void setStprice(int stprice) {
		this.stprice = stprice;
	}
	public String getFin_name() {
		return fin_name;
	}
	public void setFin_name(String fin_name) {
		this.fin_name = fin_name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String getSt_time() {
		return st_time;
	}
	public void setSt_time(String st_time) {
		this.st_time = st_time;
	}
	public String getFin_time() {
		return fin_time;
	}
	public void setFin_time(String fin_time) {
		this.fin_time = fin_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	
}
