package com.mycompany.gofarm.job.dto;

import java.util.List;

public class JobSearchDTO {
	private int jobsearchcode, usercode;
	private String js_name;
	private String js_registration;
	private String js_area;
	private String js_crop;
	private String js_time;
	private int js_salary;
	private String js_address;
	private String js_phone;
	private String js_intro;
	private String js_age;
	private String js_gender;
	private List<CareerDTO> list;
	
	public JobSearchDTO() {

	}

	public int getJobsearchcode() {
		return jobsearchcode;
	}

	public void setJobsearchcode(int jobsearchcode) {
		this.jobsearchcode = jobsearchcode;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getJs_name() {
		return js_name;
	}

	public void setJs_name(String js_name) {
		this.js_name = js_name;
	}

	public String getJs_registration() {
		return js_registration;
	}

	public void setJs_registration(String js_registration) {
		this.js_registration = js_registration;
	}

	public String getJs_area() {
		return js_area;
	}

	public void setJs_area(String js_area) {
		this.js_area = js_area;
	}

	public String getJs_crop() {
		return js_crop;
	}

	public void setJs_crop(String js_crop) {
		this.js_crop = js_crop;
	}

	public String getJs_time() {
		return js_time;
	}

	public void setJs_time(String js_time) {
		this.js_time = js_time;
	}

	public int getJs_salary() {
		return js_salary;
	}

	public void setJs_salary(int js_salary) {
		this.js_salary = js_salary;
	}

	public String getJs_address() {
		return js_address;
	}

	public void setJs_address(String js_address) {
		this.js_address = js_address;
	}

	public String getJs_phone() {
		return js_phone;
	}

	public void setJs_phone(String js_phone) {
		this.js_phone = js_phone;
	}

	public String getJs_intro() {
		return js_intro;
	}

	public void setJs_intro(String js_intro) {
		this.js_intro = js_intro;
	}

	public String getJs_age() {
		return js_age;
	}

	public void setJs_age(String js_age) {
		this.js_age = js_age;
	}

	public String getJs_gender() {
		return js_gender;
	}

	public void setJs_gender(String js_gender) {
		this.js_gender = js_gender;
	}

	public List<CareerDTO> getList() {
		return list;
	}

	public void setList(List<CareerDTO> list) {
		this.list = list;
	}
	
	

	

}
