package com.mycompany.gofarm.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.job.dao.RecruitDAO;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;
import com.mycompany.gofarm.job.dto.CareerDTO;

@Service
public class RecruitServiceImp implements RecruitService {

	@Autowired
	private RecruitDAO recruitDAO;

	public RecruitServiceImp() {

	}

	public void setDao(RecruitDAO recruitDAO) {
		this.recruitDAO = recruitDAO;
	}

	@Override
	public List<JobDTO> job_listProcess() {
		return recruitDAO.job_list();
	}

	@Override
	public List<JobSearchDTO> jobsearch_listProcess() {
		return recruitDAO.jobsearch_list();
	}

	@Override
	public int countProcess() {
		return recruitDAO.count();
	}

	@Override
	public int jobsearch_countProcess() {
		return recruitDAO.count_jobsearch();
	}

	@Override
	public List<JobDTO> listProcess(PageDTO pv) {
		return recruitDAO.list(pv);
	}

	@Override
	public List<JobSearchDTO> jobsearch_listProcess(PageDTO pv) {
		return recruitDAO.list_jobsearch(pv);
	}

	@Override
	public JobDTO contentProcess(int job) {
		return recruitDAO.content(job);
	}

	@Override
	public JobSearchDTO jobsearch_contentProcess(int jobsearchcode) {
		return recruitDAO.content_jobsearch(jobsearchcode);
	}

	/*
	 * @Override public List<JobSearchDTO> person_listProcess() { return
	 * dao.person_list(); }
	 */

	@Override
	public void insert_resumeProcess(JobSearchDTO dto) {
		recruitDAO.insert_resume(dto);
	}

	@Override
	public void insert_personProcess(JobDTO dto) {
		recruitDAO.insert_person(dto);
	}

	@Override
	public void insert_careerProcess(List<CareerDTO> list) {

		recruitDAO.insert_career(list);
	}

	@Override
	public void insert_jobchkProcess(JobCheckDTO dto) {
		recruitDAO.insert_jobcheck(dto);

	}

	@Override
	public int jcountProcess(int usercode) {
		return recruitDAO.jcount(usercode);
	}

	@Override
	public int jscountProcess(int usercode) {
		return recruitDAO.jscount(usercode);
	}

	@Override
	public int view_chkProcess(JobCheckDTO jdto) {

		return recruitDAO.view_check(jdto);

	}

	@Override
	public int chk(JobCheckDTO jdto) {
		return recruitDAO.check(jdto);
	}

	@Override
	public UserDTO getuserInfoProcess(int usercode) {
		return recruitDAO.getuserInfo(usercode);
	}

	@Override
	public List<CareerDTO> careerlist(int jobsearchcode) {
		return recruitDAO.careerlist(jobsearchcode);
	}

}