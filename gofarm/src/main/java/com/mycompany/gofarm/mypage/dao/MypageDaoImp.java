package com.mycompany.gofarm.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mycompany.gofarm.mypage.dto.MileageDTO;
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

	

}
