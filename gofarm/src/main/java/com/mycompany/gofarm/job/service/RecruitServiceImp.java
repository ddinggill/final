package com.mycompany.gofarm.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.job.dao.RecruitDAO;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.job.dto.careerDTO;

@Service
public class RecruitServiceImp implements RecruitService {

	@Autowired
	private RecruitDAO dao;

	public RecruitServiceImp() {

	}

	public void setDao(RecruitDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<JobDTO> job_listProcess() {
		return dao.job_list();
	}

	@Override
	public List<JobSearchDTO> jobsearch_listProcess() {
		return dao.jobsearch_list();
	}

	@Override
	public int countProcess() {
		return dao.count();
	}

	@Override
	public int jobsearch_countProcess() {
		return dao.count_jobsearch();
	}

	@Override
	public List<JobDTO> listProcess(PageDTO pv) {
		return dao.list(pv);
	}

	@Override
	public List<JobSearchDTO> jobsearch_listProcess(PageDTO pv) {
		return dao.list_jobsearch(pv);
	}

	@Override
	public JobDTO contentProcess(int job) {
		return dao.content(job);
	}

	@Override
	public JobSearchDTO jobsearch_contentProcess(int jobsearchcode) {
		return dao.content_jobsearch(jobsearchcode);
	}

	/*
	 * @Override public List<JobSearchDTO> person_listProcess() { return
	 * dao.person_list(); }
	 */

	@Override
	public void insert_resumeProcess(JobSearchDTO dto) {
		dao.insert_resume(dto);
	}

	@Override
	public void insert_personProcess(JobDTO dto) {
		dao.insert_person(dto);
	}

	@Override
	public void insert_careerProcess(List<careerDTO> list) {

		dao.insert_career(list);
	}

	@Override
	public void insert_jobchkProcess(JobCheckDTO dto) {
		dao.insert_jobcheck(dto);
		
	}

}
