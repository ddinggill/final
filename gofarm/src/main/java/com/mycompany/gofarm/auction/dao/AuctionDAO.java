package com.mycompany.gofarm.auction.dao;

import java.util.List;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.MileageDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface AuctionDAO {

	public int count();
	public List<AuctionDTO> auctionListMethod(PageDTO pageDto);
	public AuctionDTO auctionView(int num);
	public void au_recipeInsertMethod(Au_recipeDTO au_dto);
	public void auctionInsertMethod(AuctionDTO adto);
	public void stateUpdateMethod(int auctioncode);
	public int auctionSuccesfulMethod(int auctioncode);	
	public UserDTO successfulUserMethod(int usercode);
	public List<Au_recipeDTO> aureListMethod(int auctioncode);
	public void finNameProcess(Au_recipeDTO rdto);
	//낙찰자 마일리지 감소
	public void auctionUserMileageminus(AuctionDTO aucdto);
	//낙찰자 경매 등록자 총 마일리지 가져오기
	public UserDTO auctionTotalMileage(int usercode);
	//낙찰자 마일리지내역 추가
	public void mileageAddMethod(MileageDTO mdto);
	//판매자 마일리지 추가
	public void sellerMilPlusMethod(AuctionDTO aucdto);
}
