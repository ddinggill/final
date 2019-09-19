package com.mycompany.gofarm.donation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.donation.dto.Do_conditionDTO;
import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Repository
public class DonationDaoImp implements DonationDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	
	public void setSqlsession(SqlSessionTemplate sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public DonationDaoImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int count() {
		return sqlsession.selectOne("donation.count");
	}
	//나눔리스트를 불러옴
	@Override
	public List<DonationDTO> donationListMethod(PageDTO pageDTO) {
		return sqlsession.selectList("donation.List", pageDTO);
	}
	//나눔상세정보를 불러옴
	@Override
	public DonationDTO donationViewMethod(int docode) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("donation.view", docode) ;
	}
	//나눔신청현황을 불러옴
	@Override
	public List<Do_conditionDTO> do_conditionListMethod(int docode) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("donation.conditionView", docode);
	}
	//나눔글을 저장
	@Override
	public void donationProduceMethod(DonationDTO dodto) {
		sqlsession.insert("donation.produce", dodto);
		}

	//나눔글을 업데이트함
	@Override
	public void donationUpdateMethod(DonationDTO dodto) {
		sqlsession.update("donation.donaUpd", dodto);
	}
	//나눔글 삭제
	@Override
	public void donationDeleteMethod(int docode) {
		sqlsession.delete("donation.donaDel", docode);
	}
	//나눔 신청현황 추가
	@Override
	public void donationRequestMethod(Do_conditionDTO condto) {
		sqlsession.insert("donation.donationReq", condto);
	}
	//나눔승인시 신청현황 상태 변경
	@Override
	public void do_conditionStateUpdMethod(Do_conditionDTO condto) {
		sqlsession.update("donation.stateUpd", condto);
	}
	//나눔승인시 나눔테이블 수량 감소
	@Override
	public void donationCntMethod(int docode) {
		sqlsession.update("donation.donationCntUpd", docode);
	}
	//나눔신청인의 정보를 가져옴
	@Override
	public UserDTO userInfoMethod(int do_name) {
		return sqlsession.selectOne("donation.userInfo",do_name);
	}
	
	
}
