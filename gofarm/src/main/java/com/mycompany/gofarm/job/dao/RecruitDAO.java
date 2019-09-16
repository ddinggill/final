
package com.mycompany.gofarm.job.dao;

import java.util.List;

import com.mycompany.gofarm.job.dto.CareerDTO;
import com.mycompany.gofarm.job.dto.JobCheckDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.job.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface RecruitDAO {

	// 구인구직 메인 모집자 목록 부분

	public List<JobDTO> job_list();

	// 구인구직 근무지 신청 목록 부분

	public List<JobSearchDTO> jobsearch_list();

	// 채용부분 상세리스트 + 페이징
	public int count();

	// 구직 부분 상세리트스 + 페이징
	public int count_jobsearch();

	// 채용 데이터 리스트
	public List<JobDTO> list(PageDTO pv);

	// 구직 데이터 리스트
	public List<JobSearchDTO> list_jobsearch(PageDTO pv);

	public JobDTO content(int job);

	public JobSearchDTO content_jobsearch(int jobsearchcode);

	/*
	 * //구인 구직 메인 페이지 인력 목록 부분 public List<JobSearchDTO> person_list();
	 */

	// 이력서
	public void insert_resume(JobSearchDTO dto);

	// 채용정보
	public void insert_person(JobDTO dto);

	// 경력
	public void insert_career(List<CareerDTO> list);
	
	//이력서 구독자 체크
	public void insert_jobcheck(JobCheckDTO dto);
	
	public int jcount(int usercode);

	public int jscount(int usercode);
	
	 //view 한번만 count 체크
	public int view_check(JobCheckDTO jdto);

	public int check(JobCheckDTO jdto);
	
	//구인글 작성자의 정보 얻어오기
	public UserDTO getuserInfo(int usercode);
}
