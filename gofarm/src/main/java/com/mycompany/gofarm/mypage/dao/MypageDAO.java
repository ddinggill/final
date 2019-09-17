package com.mycompany.gofarm.mypage.dao;

import java.util.List;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface MypageDAO {
	public List<MileageDTO> mileageListMethod(int usercode);
	public List<MileageDTO> paymentListMethod(int usercode);
	public List<JobDTO> jobcheckListMethod(int jobsearchcode);
	public JobDTO jobListMethod(int usercode);
	public JobSearchDTO jobSearchListMethod(int usercode);
	public MileageDTO mileageViewMethod(int usercode);
	public void mileageInsertMethod(MileageDTO dto);
	public void mileageUpdateMethod(MileageDTO dto);
	public UserDTO userDetailViewMethod(int usercode);
	
}
