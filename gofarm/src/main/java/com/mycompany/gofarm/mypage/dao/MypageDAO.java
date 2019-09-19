package com.mycompany.gofarm.mypage.dao;

import java.util.List;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MyAuctionDTO;
import com.mycompany.gofarm.mypage.dto.MyDonationDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface MypageDAO {
	public List<MileageDTO> mileageListMethod(int usercode);
	public List<MileageDTO> paymentListMethod(int usercode);
	public List<JobDTO> jobcheckListMethod(int jobsearchcode);
	public List<MySellDTO> mySellListMethod(int usercode);
	public List<MySellDTO> myBuyListMethod(int usercode);
	public List<MyAuctionDTO> myAuctionListMethod(int usercode);
	public List<MyAuctionDTO> myBidListMethod(int usercode);
	public List<MyDonationDTO> myDonationListMethod(int usercode);
	public JobDTO jobListMethod(int usercode);
	public JobSearchDTO jobSearchListMethod(int usercode);
	public MileageDTO mileageViewMethod(int usercode);
	public void mileageInsertMethod(MileageDTO dto);
	public void mileageUpdateMethod(MileageDTO dto);
	public UserDTO userDetailViewMethod(int usercode);
	
}
