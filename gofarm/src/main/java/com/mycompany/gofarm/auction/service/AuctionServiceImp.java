package com.mycompany.gofarm.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.auction.dao.AuctionDAO;
import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.MileageDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Service
public class AuctionServiceImp implements AuctionService{
    @Autowired
	private AuctionDAO auctionDao;
	
    public void setAuctionDao(AuctionDAO auctionDao) {
		this.auctionDao = auctionDao;
	}
    
    public AuctionServiceImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int countProcess() {
	return auctionDao.count();
	}

	@Override
	public List<AuctionDTO> auctionListService(PageDTO pageDto) {
		// TODO Auto-generated method stub
		return auctionDao.auctionListMethod(pageDto);
	}

	@Override
	public AuctionDTO auctionViewProcess(int num) {
		
		return auctionDao.auctionView(num);
	}

	@Override
	public void au_recipeInsertProcess(Au_recipeDTO au_dto) {
		auctionDao.au_recipeInsertMethod(au_dto);
		
	}

	@Override
	public void auctionInsertProcess(AuctionDTO adto) {
		auctionDao.auctionInsertMethod(adto);
	}

	@Override
	public void stateUpdeteProcess(int auctioncode) {
			auctionDao.stateUpdateMethod(auctioncode);
	}

	@Override
	public int auctionSuccessfulProcess(int auctioncode) {
		// TODO Auto-generated method stub
		return auctionDao.auctionSuccesfulMethod(auctioncode);
	}

	@Override
	public UserDTO successfulUserProcess(int usercode) {
		// TODO Auto-generated method stub
		return auctionDao.successfulUserMethod(usercode);
	}

	@Override
	public List<Au_recipeDTO> auctionListProcess(int auctioncode) {
		// TODO Auto-generated method stub
		return auctionDao.aureListMethod(auctioncode);
	}
    
	@Override
	public void finNameProcess(Au_recipeDTO rdto) {
		auctionDao.finNameProcess(rdto);
	}

	@Override
	public void auctionUserMileageminusProcess(AuctionDTO aucdto) {
		//낙찰자 마일리지 변경
		auctionDao.auctionUserMileageminus(aucdto);
	}

	@Override
	public UserDTO auctionTotalMileageProcess(int usercode) {
		return auctionDao.auctionTotalMileage(usercode);
	}

	@Override
	public void mileageAddProcess(MileageDTO mdto) {
		auctionDao.mileageAddMethod(mdto);
	}

	@Override
	public void sellerMilPlusProcess(AuctionDTO aucdto) {
		auctionDao.sellerMilPlusMethod(aucdto);
	}
    
}
