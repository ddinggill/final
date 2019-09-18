package com.mycompany.gofarm.donation.service;

import java.util.List;

import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;

public interface DonationService {

	//나눔 리스트를 불러온다.
	public int countProcess();
	public List<DonationDTO> donationListProcess(PageDTO pageDTO);
		
	
	
	
}
