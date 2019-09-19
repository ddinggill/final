package com.mycompany.gofarm.chat.dto;

public class ChatDTO {

	private String ct_time;
	private int chatcode;
	private String ct_nickname;
	private String ct_content;
	private String type;
	
	public ChatDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ChatDTO(String ct_time, int chatcode, String ct_nickname, String ct_content, String type) {
		super();
		this.ct_time = ct_time;
		this.chatcode = chatcode;
		this.ct_nickname = ct_nickname;
		this.ct_content = ct_content;
		this.type = type;
	}

	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCt_time() {
		return ct_time;
	}

	public void setCt_time(String ct_time) {
		this.ct_time = ct_time;
	}

	public int getChatcode() {
		return chatcode;
	}

	public void setChatcode(int chatcode) {
		this.chatcode = chatcode;
	}

	public String getCt_nickname() {
		return ct_nickname;
	}

	public void setCt_nickname(String ct_nickname) {
		this.ct_nickname = ct_nickname;
	}

	public String getCt_content() {
		return ct_content;
	}

	public void setCt_content(String ct_content) {
		this.ct_content = ct_content;
	}
	
}
