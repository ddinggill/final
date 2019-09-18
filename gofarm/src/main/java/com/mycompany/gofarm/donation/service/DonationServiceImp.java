package com.mycompany.gofarm.donation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.donation.dao.DonationDAO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;

@Service
public class DonationServiceImp implements DonationService{
	@Autowired
	private DonationDAO donationDao;
	
	public void setDonationDao(DonationDAO donationDao) {
		this.donationDao = donationDao;
	}
	
	public DonationServiceImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return donationDao.count();
	}

	@Override
	public List<DonationDTO> donationListProcess(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return donationDao.donationListMethod(pageDTO);
	}
	
	
	
	
}
