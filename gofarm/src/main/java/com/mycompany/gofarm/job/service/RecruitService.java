package com.mycompany.gofarm.job.service;

import java.util.List;

import com.mycompany.gofarm.job.dto.CareerDTO;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface RecruitService {

	public List<JobDTO> job_listProcess();

	public List<JobSearchDTO> jobsearch_listProcess();

	public int countProcess();

	public int jobsearch_countProcess();

	public List<JobDTO> listProcess(PageDTO pv);

	public List<JobSearchDTO> jobsearch_listProcess(PageDTO pv);

	public JobDTO contentProcess(int num);

	public JobSearchDTO jobsearch_contentProcess(int num);
	/*
	 * public List<JobSearchDTO> person_listProcess();
	 */

	public void insert_resumeProcess(JobSearchDTO dto);

	public void insert_personProcess(JobDTO dto);

	public void insert_careerProcess(List<CareerDTO> list);
	
	public void insert_jobchkProcess(JobCheckDTO dto);
	
	public int jcountProcess(int usercode); //중복확인
	public int jscountProcess(int usercode);
	
	public int view_chkProcess(JobCheckDTO jdto);

	public int chk(JobCheckDTO jdto);
	
	public UserDTO getuserInfoProcess(int usercode);

	public List<CareerDTO> careerlist(int jobsearchcode);
}
