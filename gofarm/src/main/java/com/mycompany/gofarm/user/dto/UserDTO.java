package com.mycompany.gofarm.user.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class UserDTO {
	
	private int usercode;
	private String userid;
	private String userpw;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String nickname;
	private int userlvl;
	private String bank;
	private String account;
	private int mileage;
	private String user_home;
	
	public UserDTO() {
		
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getUser_home() {
		return user_home;
	}

	public void setUser_home(String user_home) {
		this.user_home = user_home;
	}

}
