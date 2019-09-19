package com.mycompany.gofarm.board.dto;

public class CommentsDTO {
	
	// 댓글 코드 , 게시글 코드, 유저코드(작성자)
	private int commentcode, boardcode, usercode;
	private String content;
	private String com_day;//작성일
	private String nickname;

	public CommentsDTO() {
		// TODO Auto-generated constructor stub
	}

	
	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getCommentcode() {
		return commentcode;
	}

	public void setCommentcode(int commentcode) {
		this.commentcode = commentcode;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCom_day() {
		return com_day;
	}

	public void setCom_day(String com_day) {
		this.com_day = com_day;
	}

	
	

}
