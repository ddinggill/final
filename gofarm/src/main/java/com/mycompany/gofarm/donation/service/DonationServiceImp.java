package com.mycompany.gofarm.donation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.donation.dao.DonationDAO;
import com.mycompany.gofarm.donation.dto.Do_conditionDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

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
	//나눔리스트를 불러옴
	@Override
	public List<DonationDTO> donationListProcess(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return donationDao.donationListMethod(pageDTO);
	}
	//나눔상세정보를 불러옴
	@Override
	public DonationDTO donationViewProcess(int docode) {
		// TODO Auto-generated method stub
		return donationDao.donationViewMethod(docode);
	}
	//나눔신청현황을 불러옴
	@Override
	public List<Do_conditionDTO> do_conditionListProcess(int docode) {
		// TODO Auto-generated method stub
		return donationDao.do_conditionListMethod(docode);
	}
	//나눔글을 저장
	@Override
	public void donationProduceProcess(DonationDTO dodto) {
		donationDao.donationProduceMethod(dodto);
	}
	//나눔글 업데이트
	@Override
	public void donationUpdateProcess(DonationDTO dodto) {
		donationDao.donationUpdateMethod(dodto);
	}
	//나눔글 삭제
	@Override
	public void donationDeleteProcess(int docode) {
		donationDao.donationDeleteMethod(docode);
	}
	//나눔 신청현황 추가
	@Override
	public void donationRequestProcess(Do_conditionDTO condto) {
		donationDao.donationRequestMethod(condto);
	}
	//나눔 승인시 신청현황의 상태 변경
	@Override
	public void do_conditionStateUpdMethod(Do_conditionDTO condto) {
		donationDao.do_conditionStateUpdMethod(condto);
	}
	//나눔승인시 나눔테이블 수량 감소
	@Override
	public void donationCntProcess(int docode) {
		donationDao.donationCntMethod(docode);
	}
	//나눔신청인의 정보를 가져옴
	@Override
	public UserDTO userInfoProcess(int do_name) {
		return donationDao.userInfoMethod(do_name);
	}
	
	
	
	
}
