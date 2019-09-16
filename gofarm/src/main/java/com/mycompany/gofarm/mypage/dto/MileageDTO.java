package com.mycompany.gofarm.mypage.dto;

import java.util.Date;

public class MileageDTO {
	private int usercode;
	private int m_list;
	private int m_total;
	private Date m_day;
	private String m_content;
	
	public MileageDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public int getM_list() {
		return m_list;
	}

	public void setM_list(int m_list) {
		this.m_list = m_list;
	}

	public int getM_total() {
		return m_total;
	}

	public void setM_total(int m_total) {
		this.m_total = m_total;
	}

	public Date getM_day() {
		return m_day;
	}

	public void setM_day(Date m_day) {
		this.m_day = m_day;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	
}
