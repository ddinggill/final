package com.mycompany.gofarm.auction.service;

import java.util.List;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.MileageDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface AuctionService {
	

	public int countProcess();
	public List<AuctionDTO> auctionListService(PageDTO pageDto);
	public AuctionDTO auctionViewProcess(int num);
	public void au_recipeInsertProcess(Au_recipeDTO au_dto);
	public void auctionInsertProcess(AuctionDTO adto);
	public void stateUpdeteProcess(int auctioncode);
	public int auctionSuccessfulProcess(int auctioncode);
	public UserDTO successfulUserProcess(int usercode);
	public List<Au_recipeDTO> auctionListProcess(int auctioncode);
	public void finNameProcess(Au_recipeDTO rdto);
	//낙찰자 마일리지 감소
	public void auctionUserMileageminusProcess(AuctionDTO aucdto);
	//낙찰자 경매 등록자 총 마일리지 가져오기
	public UserDTO auctionTotalMileageProcess(int usercode);
	//낙찰자 마일리지내역 추가
	public void mileageAddProcess(MileageDTO mdto);
	//판매자 마일리지 추가
	public void sellerMilPlusProcess(AuctionDTO aucdto);
}
