package com.mycompany.gofarm.admin.dao;

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

public interface AdminDAO {

	//유저 목록 리스트
	public List<UserDTO> adminUserListMethod();
	//유저삭제
	public void adminUserDeleteMethod(int usercode);
	
		//판매목록
		public List<ProductDTO> adminProductListMethod();
		//판매삭제
		public void adminProductDeleteMethod(int prod_code);
		//경매 목록
		public List<AuctionDTO> adminAuctionListMethod();
		//나눔 목록
		public List<DonationDTO> adminDonationListMethod();
		//나눔 삭제
		public void adminDonationDeleteMethod(int docode);
		//구인목록 
		public List<JobDTO> adminJobListMethod();
		//구인 삭제
		public void adminJobDeleteMethod(int jobcode);
		//구직 목록
		public List<JobSearchDTO> adminJobsearchListMethod();
		//구직 삭제
		public void adminJobserachDeleteMethod(int jobsearchcode);
		//마일리지 충전 목록
		public List<MileageDTO> adminMileageChargeListMethod();
		//마일리지 출금 목롣
		public List<MileageDTO> adminMileagePaymentListMethod();
		//게시글 목록
		public List<BoardDTO> adminBoardListMethod();
		//게시글 삭제
		public void adminBoardDeleteMethod(int boardcode);
		//진행중 채팅방 목록 
		public List<ChatDTO> adminChatRoomListMethod();
		//채팅방 삭제
		public void adminChatRoomDeleteMethod(int chatcode);
		
		
}
