package com.mycompany.gofarm.donation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.donation.dto.DonationDTO;
import com.mycompany.gofarm.donation.dto.PageDTO;

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

	@Override
	public List<DonationDTO> donationListMethod(PageDTO pageDTO) {
		return sqlsession.selectList("donation.List", pageDTO);
	}
	
	
	
}
