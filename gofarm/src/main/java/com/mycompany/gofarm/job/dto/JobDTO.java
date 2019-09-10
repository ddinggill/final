package com.mycompany.gofarm.job.dto;

import java.sql.Clob;
import java.util.Date;

//구인 테이블  (job)
public class JobDTO {

	private int job, usercode, j_Recruitment;
	private String j_company;
	private String j_area;
	private String j_career;
	private String j_gender;
	private String j_age;
	private String j_type;
	private String j_term;
	private String j_info;
	private String j_address;
	private String j_Preferential;
	private String j_Contact;
	private String j_Registration, j_deadline;
	private String content;

	public JobDTO() {

	}

	public int getJob() {
		return job;
	}

	public void setJob(int job) {
		this.job = job;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public int getJ_Recruitment() {
		return j_Recruitment;
	}

	public void setJ_Recruitment(int j_Recruitment) {
		this.j_Recruitment = j_Recruitment;
	}

	public String getJ_company() {
		return j_company;
	}

	public void setJ_company(String j_company) {
		this.j_company = j_company;
	}

	public String getJ_area() {
		return j_area;
	}

	public void setJ_area(String j_area) {
		this.j_area = j_area;
	}

	public String getJ_career() {
		return j_career;
	}

	public void setJ_career(String j_career) {
		this.j_career = j_career;
	}

	public String getJ_gender() {
		return j_gender;
	}

	public void setJ_gender(String j_gender) {
		this.j_gender = j_gender;
	}

	public String getJ_age() {
		return j_age;
	}

	public void setJ_age(String j_age) {
		this.j_age = j_age;
	}

	public String getJ_type() {
		return j_type;
	}

	public void setJ_type(String j_type) {
		this.j_type = j_type;
	}

	public String getJ_term() {
		return j_term;
	}

	public void setJ_term(String j_term) {
		this.j_term = j_term;
	}

	public String getJ_info() {
		return j_info;
	}

	public void setJ_info(String j_info) {
		this.j_info = j_info;
	}

	public String getJ_address() {
		return j_address;
	}

	public void setJ_address(String j_address) {
		this.j_address = j_address;
	}

	public String getJ_Preferential() {
		return j_Preferential;
	}

	public void setJ_Preferential(String j_Preferential) {
		this.j_Preferential = j_Preferential;
	}

	public String getJ_Contact() {
		return j_Contact;
	}

	public void setJ_Contact(String j_Contact) {
		this.j_Contact = j_Contact;
	}

	public String getJ_Registration() {
		return j_Registration;
	}

	public void setJ_Registration(String j_Registration) {
		this.j_Registration = j_Registration;
	}

	public String getJ_deadline() {
		return j_deadline;
	}

	public void setJ_deadline(String j_deadline) {
		this.j_deadline = j_deadline;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
