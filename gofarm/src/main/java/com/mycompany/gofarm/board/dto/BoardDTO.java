package com.mycompany.gofarm.board.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {

	private int boardcode, usercode;
	private String b_title;
	private String content;
	private String b_day;
	private String b_file;
	private String b_category;
	private String nickname;

	private List<CommentsDTO> replyList;

	private MultipartFile up_file;

	public BoardDTO() {

	}

	public List<CommentsDTO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<CommentsDTO> replyList) {
		this.replyList = replyList;
	}

	public MultipartFile getUp_file() {
		return up_file;
	}

	public void setUp_file(MultipartFile up_file) {
		this.up_file = up_file;
	}

	public int getBoardcode() {
		return boardcode;
	}

	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getB_day() {
		return b_day;
	}

	public void setB_day(String b_day) {
		this.b_day = b_day;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
