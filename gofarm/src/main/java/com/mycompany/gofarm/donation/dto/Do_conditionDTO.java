package com.mycompany.gofarm.donation.dto;

public class Do_conditionDTO {

	
	private int docode;
	private int do_name;
	private int state;
	private String phoneNumber;
	private String username;
	public Do_conditionDTO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public int getDocode() {
		return docode;
	}

	public void setDocode(int docode) {
		this.docode = docode;
	}

	public int getDo_name() {
		return do_name;
	}

	public void setDo_name(int do_name) {
		this.do_name = do_name;
	}
	
	
	
}
