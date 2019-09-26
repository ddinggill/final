package com.mycompany.gofarm.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.chat.dto.ChatDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Repository
public class AdminDaoImp implements AdminDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public void setSqlsession(SqlSessionTemplate sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public AdminDaoImp() {
		// TODO Auto-generated constructor stub
	}
	//유저목록 리스트
	@Override
	public List<UserDTO> adminUserListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.userList");
	}
	//유저 삭제
	@Override
	public void adminUserDeleteMethod(int usercode) {
		sqlsession.update("admin.userDelete", usercode);
		
	}
	//판매 목록
	@Override
	public List<ProductDTO> adminProductListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.productList");
	}
	//판매 삭제
	@Override
	public void adminProductDeleteMethod(int prod_code) {
		sqlsession.delete("admin.productDelete", prod_code);
		
	}
	//경매 목록
	@Override
	public List<AuctionDTO> adminAuctionListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.auctionList");
	}
	//나눔목록
	@Override
	public List<DonationDTO> adminDonationListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.donationList");
	}
	//나눔 삭제
	@Override
	public void adminDonationDeleteMethod(int docode) {
		sqlsession.delete("admin.donationDelete", docode);
	}
	//구인 목록
	@Override
	public List<JobDTO> adminJobListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.JobList");
	}
	//구인 삭제
	@Override
	public void adminJobDeleteMethod(int job) {
		sqlsession.delete("admin.jobDelete", job);
		
	}
	//구직 목록
	@Override
	public List<JobSearchDTO> adminJobsearchListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.jobsearchList");
	}
	//구직 삭제
	@Override
	public void adminJobserachDeleteMethod(int jobsearchcode) {
		sqlsession.delete("admin.jobsearchDelete", jobsearchcode);
	}
	//마일리지 충전 목록
	@Override
	public List<MileageDTO> adminMileageChargeListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.mileageCharge");
	}
	//마일리지 출금 목록
	@Override
	public List<MileageDTO> adminMileagePaymentListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.mileagePayment");
	}
	//게시글 목록 
	@Override
	public List<BoardDTO> adminBoardListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.boardList");
	}
	//게시글 삭제
	@Override
	public void adminBoardDeleteMethod(int boardcode) {
		sqlsession.delete("admin.boardDelete", boardcode);
	}
	//진행중 채팅방 목록
	@Override
	public List<ChatDTO> adminChatRoomListMethod() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("admin.chatList");
	}
	//채팅방 삭제
	@Override
	public void adminChatRoomDeleteMethod(int chatcode) {
		sqlsession.delete("admin.chatDelete", chatcode);
	}
	
	
	
	
	
}
