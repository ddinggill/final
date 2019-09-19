package com.mycompany.gofarm.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.job.dto.JobSearchDTO;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.mypage.dto.MyAuctionDTO;
import com.mycompany.gofarm.mypage.dto.MyDonationDTO;
import com.mycompany.gofarm.mypage.dto.MySellDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Repository
public class MypageDaoImp implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public MypageDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<MileageDTO> mileageListMethod(int usercode) {
		return sqlsession.selectList("mypage.mileage_list", usercode);
	}

	@Override
	public MileageDTO mileageViewMethod(int usercode) {
		return sqlsession.selectOne("mypage.mileage_view", usercode);
	}
	
	@Override
	public void mileageInsertMethod(MileageDTO dto) {
		sqlsession.insert("mypage.mileage_insert", dto);
	}

	@Override
	public void mileageUpdateMethod(MileageDTO dto) {
		sqlsession.update("mypage.mileage_update", dto);
		
	}

	@Override
	public UserDTO userDetailViewMethod(int usercode) {
		return sqlsession.selectOne("mypage.userDetail_view", usercode);
	}

	@Override
	public List<MileageDTO> paymentListMethod(int usercode) {
		return sqlsession.selectList("mypage.payment_list", usercode);
	}

	@Override
	public JobDTO jobListMethod(int usercode) {
		return sqlsession.selectOne("mypage.job_view", usercode);
	}

	@Override
	public JobSearchDTO jobSearchListMethod(int usercode) {
		return sqlsession.selectOne("mypage.jobSearch_view", usercode);
	}

	@Override
	public List<JobDTO> jobcheckListMethod(int jobsearchcode) {
		return sqlsession.selectList("mypage.jobcheck_list", jobsearchcode);
	}

	@Override
	public List<MySellDTO> mySellListMethod(int usercode) {
		return sqlsession.selectList("mypage.mySell_list", usercode);
	}

	@Override
	public List<MySellDTO> myBuyListMethod(int usercode) {
		return sqlsession.selectList("mypage.myBuy_list", usercode);
	}

	@Override
	public List<MyAuctionDTO> myAuctionListMethod(int usercode) {
		return sqlsession.selectList("mypage.myAuction_list", usercode);
	}

	@Override
	public List<MyAuctionDTO> myBidListMethod(int usercode) {
		return sqlsession.selectList("mypage.myBid_list", usercode);
	}

	@Override
	public List<MyDonationDTO> myDonationListMethod(int usercode) {
		return sqlsession.selectList("mypage.myDonation_list", usercode);
	}


	

}
