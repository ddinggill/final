package com.mycompany.gofarm.donation.dao;

import java.util.List;

import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;

public interface DonationDAO {
	//나눔 리스트를 불러온다.
	public int count();
	public List<DonationDTO> donationListMethod(PageDTO pageDTO);
	
	
	

}
