package com.mycompany.gofarm.auction.service;

import java.util.List;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;

public interface AuctionService {
	

	public int countProcess();
	public List<AuctionDTO> auctionListService(PageDTO pageDto);
	public AuctionDTO auctionViewProcess(int num);
	public void au_recipeInsertProcess(Au_recipeDTO au_dto);
	public void auctionInsertProcess(AuctionDTO adto);
	
}
