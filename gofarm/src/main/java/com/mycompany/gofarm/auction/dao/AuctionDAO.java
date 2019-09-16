package com.mycompany.gofarm.auction.dao;

import java.util.List;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface AuctionDAO {

	public int count();
	public List<AuctionDTO> auctionListMethod(PageDTO pageDto);
	public AuctionDTO auctionView(int num);
	public void au_recipeInsertMethod(Au_recipeDTO au_dto);
	public void auctionInsertMethod(AuctionDTO adto);
	
}
