package com.mycompany.gofarm.mypage.service;

import java.util.List;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MyAuctionDTO;
import com.mycompany.gofarm.mypage.dto.MyDonationDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.mypage.dto.myIndexCntDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface MypageService {
	public List<MileageDTO> mileageListService(int usercode);
	public List<MileageDTO> paymentListService(int usercode);
	public List<JobDTO> jobcheckListService(int jobsearchcode);
	public List<MySellDTO> mySellListService(int usercode);
	public List<MySellDTO> myBuyListService(int usercode);
	public List<MyAuctionDTO> myAuctionListService(int usercode);
	public List<MyAuctionDTO> myBidListService(int usercode);
	public List<MyDonationDTO> myDonationListService(int usercode);
	public JobDTO jobListService(int usercode);
	public JobSearchDTO jobSearchListService(int usercode);
	public MileageDTO mileageViewService(int usercode);
	public void mileageInsertService(MileageDTO dto);
	public void mileageUpdateService(MileageDTO dto);
	public UserDTO userDetailViewService(int usercode);
	public myIndexCntDTO myIndexCntService(int usercode);
	public List<MileageDTO> myDailyMileageService(int usercode);
	public List<BoardDTO> myBoardListService(int usercode);
}
