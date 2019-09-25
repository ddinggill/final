package com.mycompany.gofarm.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.admin.dao.AdminDAO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.chat.dto.ChatDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.user.dto.UserDTO;
@Service
public class AdminServiceImp implements AdminService{

	@Autowired	
	private AdminDAO adminDao;
	
	
	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}
	
	public AdminServiceImp() {
		// TODO Auto-generated constructor stub
	}
	//유저 목록 리스트
	@Override
	public List<UserDTO> adminUserListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminUserListMethod();
	}
	//유저삭제
	@Override
	public void adminUserDeleteProcess(int usercode) {
		adminDao.adminUserDeleteMethod(usercode);
		
	}
	//판매목록
	@Override
	public List<ProductDTO> adminProductListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminProductListMethod();
	}
	//판매삭제
	@Override
	public void adminProductDeleteProcess(int prod_code) {
		adminDao.adminProductDeleteMethod(prod_code);
		
	}
	//경매 목록
	@Override
	public List<AuctionDTO> adminAuctionListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminAuctionListMethod();
	}
	//나눔 목록
	@Override
	public List<DonationDTO> adminDonationListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminDonationListMethod();
	}
	//나눔 삭제
	@Override
	public void adminDonationDeleteProcess(int docode) {
		adminDao.adminDonationDeleteMethod(docode);
	}
	//구인목록
	@Override
	public List<JobDTO> adminJobListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminJobListMethod();
	}
	//구인 삭제
	@Override
	public void adminJobDeleteProcess(int job) {
		adminDao.adminJobDeleteMethod(job);
		
	}
	//구직 목록
	@Override
	public List<JobSearchDTO> adminJobsearchListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminJobsearchListMethod();
	}
	//구직 삭제
	@Override
	public void adminJobserachDeleteProcess(int jobsearchcode) {
		adminDao.adminJobserachDeleteMethod(jobsearchcode);
		
	}
	//마일리지 충전 목록
	@Override
	public List<MileageDTO> adminMileageChargeListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminMileageChargeListMethod();
	}
	//마일리지 출금 목롣
	@Override
	public List<MileageDTO> adminMileagePaymentListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminMileagePaymentListMethod();
	}
	//게시글 목록
	@Override
	public List<BoardDTO> adminBoardListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminBoardListMethod();
	}
	//게시글 삭제
	@Override
	public void adminBoardDeleteProcess(int boardcode) {
		adminDao.adminBoardDeleteMethod(boardcode);
		
	}
	//진행중 채팅방 목록 
	@Override
	public List<ChatDTO> adminChatRoomListProcess() {
		// TODO Auto-generated method stub
		return adminDao.adminChatRoomListMethod();
	}
	//채팅방 삭제
	@Override
	public void adminChatRoomDeleteProcess(int chatcode) {
		adminDao.adminChatRoomDeleteMethod(chatcode);
	}
	
	
	
	
}
