package com.mycompany.gofarm.chat.dto;

public class ChatRoomDTO {

	private int chatcode;
	private int usercode;
	private String ct_title;
	private int ct_limit;
	private String last_message;
	
	public String getLast_message() {
		return last_message;
	}

	public void setLast_message(String last_message) {
		this.last_message = last_message;
	}

	public ChatRoomDTO() {
		
	}

	public int getChatcode() {
		return chatcode;
	}

	public void setChatcode(int chatcode) {
		this.chatcode = chatcode;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getCt_title() {
		return ct_title;
	}

	public void setCt_title(String ct_title) {
		this.ct_title = ct_title;
	}

	public int getCt_limit() {
		return ct_limit;
	}

	public void setCt_limit(int ct_limit) {
		this.ct_limit = ct_limit;
	}
	
	
}
