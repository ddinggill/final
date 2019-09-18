package com.mycompany.gofarm.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dao.MypageDAO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Service
public class MypageServiceImp implements MypageService{

	@Autowired
	private MypageDAO mypageDao;
	
	public void setMypageDao(MypageDAO mypageDao) {
		this.mypageDao = mypageDao;
	}

	public MypageServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<MileageDTO> mileageListService(int usercode) {
		return mypageDao.mileageListMethod(usercode);
	}

	@Override
	public MileageDTO mileageViewService(int usercode) {
		return mypageDao.mileageViewMethod(usercode);
	}
	
	@Override
	public void mileageInsertService(MileageDTO dto) {
		mypageDao.mileageInsertMethod(dto);
	}

	@Override
	public void mileageUpdateService(MileageDTO dto) {
		mypageDao.mileageUpdateMethod(dto);
		
	}

	@Override
	public UserDTO userDetailViewService(int usercode) {
		return mypageDao.userDetailViewMethod(usercode);
	}

	@Override
	public List<MileageDTO> paymentListService(int usercode) {
		return mypageDao.paymentListMethod(usercode);
	}

	@Override
	public JobDTO jobListService(int usercode) {
		return mypageDao.jobListMethod(usercode);
	}

	@Override
	public JobSearchDTO jobSearchListService(int usercode) {
		return mypageDao.jobSearchListMethod(usercode);
	}

	@Override
	public List<JobDTO> jobcheckListService(int jobsearchcode) {
		return mypageDao.jobcheckListMethod(jobsearchcode);
	}

	@Override
	public List<MySellDTO> mysellListService(int usercode) {
		return mypageDao.mysellListMethod(usercode);
	}

}
