package com.mycompany.gofarm.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;
import com.mycompany.gofarm.job.dto.CareerDTO;

@Repository
public class RecruitDaoImp implements RecruitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public RecruitDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<JobDTO> job_list() {
		return sqlSession.selectList("recruit.job");
	}

	@Override
	public List<JobSearchDTO> jobsearch_list() {
		return sqlSession.selectList("recruit.jobsearch");
	}

	@Override
	public int count() {

		return sqlSession.selectOne("recruit.count");
	}

	@Override
	public int count_jobsearch() {
		return sqlSession.selectOne("recruit.count_person");
	}

	@Override
	public List<JobDTO> list(PageDTO pv) {

		return sqlSession.selectList("recruit.job_list", pv);
	}

	@Override
	public List<JobSearchDTO> list_jobsearch(PageDTO pv) {
		return sqlSession.selectList("recruit.jobsearch_list", pv);
	}

	@Override
	public JobDTO content(int job) {
		return sqlSession.selectOne("recruit.resum", job);
	}

	@Override
	public JobSearchDTO content_jobsearch(int jobsearchcode) {
		return sqlSession.selectOne("recruit.personlist", jobsearchcode);
	}

	/*
	 * @Override public List<JobSearchDTO> person_list() { return
	 * sqlSession.selectList("recruit.jobsearch");
	 * 
	 * }
	 */

	@Override
	public void insert_resume(JobSearchDTO dto) {
		sqlSession.insert("recruit.resume", dto);
	}

	@Override
	public void insert_person(JobDTO dto) {
		sqlSession.insert("recruit.person", dto);
	}

	@Override
	public void insert_career(List<CareerDTO> list) {
		sqlSession.insert("recruit.career", list);
	}

	@Override
	public void insert_jobcheck(JobCheckDTO dto) {
		sqlSession.insert("recruit.jobcheck", dto);

	}

	@Override
	public int jcount(int usercode) {
		return sqlSession.selectOne("recruit.jusercodecount", usercode);
	}

	@Override
	public int jscount(int usercode) {
		return sqlSession.selectOne("recruit.jsusercodecount", usercode);
	}

	@Override
	public int view_check(JobCheckDTO jdto) {
		return sqlSession.selectOne("recruit.view_chk", jdto);
	}

	@Override
	public int check(JobCheckDTO jdto) {
		return sqlSession.selectOne("recruit.chk", jdto);
	}

	@Override
	public UserDTO getuserInfo(int usercode) {
		return sqlSession.selectOne("recruit.getinfo", usercode);
	}

	@Override
	public List<CareerDTO> careerlist(int jobsearchcode) {
		return sqlSession.selectList("recruit.careerlist", jobsearchcode);
	}

	@Override
	public int samechk(JobCheckDTO jdto) {
		return sqlSession.selectOne("recruit.samechk", jdto);
	}

	@Override
	public JobDTO jobupdateSelect(int job) {
		return sqlSession.selectOne("recruit.jobupdateselect", job);
	}

	@Override
	public void jobupdate(JobDTO dto) {
		sqlSession.update("recruit.jobupdate", dto);
	}

	@Override
	public void jobdelete(int job) {
		sqlSession.delete("recruit.jobdelete", job);
	}

	@Override
	public void jsdelete(int jobsearchcode) {
		sqlSession.delete("recruit.jsdelete", jobsearchcode);
	}

}