package com.mycompany.gofarm.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.auction.dao.AuctionDAO;
import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;

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
    
    
    
    
}
