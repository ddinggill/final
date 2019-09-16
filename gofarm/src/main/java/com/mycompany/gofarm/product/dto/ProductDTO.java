package com.mycompany.gofarm.product.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int prod_code;
	private int usercode;
	private String pd_file;
	private String pd_name;
	private int pd_price;
	private int pd_cnt;
	private String producer;
	private String origin;
	private String pd_phone;
	private String pd_detail;
	
	private MultipartFile upload;
	
	
	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getProd_code() {
		return prod_code;
	}

	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getPd_file() {
		return pd_file;
	}

	public void setPd_file(String pd_file) {
		this.pd_file = pd_file;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public int getPd_price() {
		return pd_price;
	}

	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}

	public int getPd_cnt() {
		return pd_cnt;
	}

	public void setPd_cnt(int pd_cnt) {
		this.pd_cnt = pd_cnt;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getPd_phone() {
		return pd_phone;
	}

	public void setPd_phone(String pd_phone) {
		this.pd_phone = pd_phone;
	}

	public String getPd_detail() {
		return pd_detail;
	}

	public void setPd_detail(String pd_detail) {
		this.pd_detail = pd_detail;
	}
	
	

	
	
	
	
	
	
}
