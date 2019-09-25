package com.mycompany.gofarm.admin.service;

import java.util.List;

import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.chat.dto.ChatDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface AdminService {

	
	//유저 목록 리스트
		public List<UserDTO> adminUserListProcess();
		//유저삭제
		public void adminUserDeleteProcess(int usercode);
		
			//판매목록
			public List<ProductDTO> adminProductListProcess();
			//판매삭제
			public void adminProductDeleteProcess(int prod_code);
			//경매 목록
			public List<AuctionDTO> adminAuctionListProcess();
			//나눔 목록
			public List<DonationDTO> adminDonationListProcess();
			//나눔 삭제
			public void adminDonationDeleteProcess(int docode);
			//구인목록 
			public List<JobDTO> adminJobListProcess();
			//구인 삭제
			public void adminJobDeleteProcess(int job);
			//구직 목록
			public List<JobSearchDTO> adminJobsearchListProcess();
			//구직 삭제
			public void adminJobserachDeleteProcess(int jobsearchcode);
			//마일리지 충전 목록
			public List<MileageDTO> adminMileageChargeListProcess();
			//마일리지 출금 목롣
			public List<MileageDTO> adminMileagePaymentListProcess();
			//게시글 목록
			public List<BoardDTO> adminBoardListProcess();
			//게시글 삭제
			public void adminBoardDeleteProcess(int boardcode);
			//진행중 채팅방 목록 
			public List<ChatDTO> adminChatRoomListProcess();
			//채팅방 삭제
			public void adminChatRoomDeleteProcess(int chatcode);
}
