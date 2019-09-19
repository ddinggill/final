package com.mycompany.gofarm.mypage.service;

import java.util.List;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MyAuctionDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface MypageService {
	public List<MileageDTO> mileageListService(int usercode);
	public List<MileageDTO> paymentListService(int usercode);
	public List<JobDTO> jobcheckListService(int jobsearchcode);
	public List<MySellDTO> mysellListService(int usercode);
	public List<MySellDTO> myBuyListService(int usercode);
	public List<MyAuctionDTO> myAuctionListService(int usercode);
	public JobDTO jobListService(int usercode);
	public JobSearchDTO jobSearchListService(int usercode);
	public MileageDTO mileageViewService(int usercode);
	public void mileageInsertService(MileageDTO dto);
	public void mileageUpdateService(MileageDTO dto);
	public UserDTO userDetailViewService(int usercode);
}
