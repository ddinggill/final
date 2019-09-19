package com.mycompany.gofarm.job.dto;

public class CareerDTO {

   private int jobsearchcode;
   private String career;
   private String startdate;
   private String enddate;

   public CareerDTO() {
	   
   }

   public int getJobsearchcode() {
      return jobsearchcode;
   }

   public void setJobsearchcode(int jobsearchcode) {
      this.jobsearchcode = jobsearchcode;

   }

   public String getCareer() {
      return career;
   }

   public void setCareer(String career) {
      this.career = career;
   }

   public String getStartdate() {
      return startdate;
   }

   public void setStartdate(String startdate) {
      this.startdate = startdate;
   }

   public String getEnddate() {
      return enddate;
   }

   public void setEnddate(String enddate) {
      this.enddate = enddate;
   }
   
   

}