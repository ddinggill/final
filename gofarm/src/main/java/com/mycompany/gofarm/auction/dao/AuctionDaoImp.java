package com.mycompany.gofarm.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.MileageDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

@Repository
public class AuctionDaoImp implements AuctionDAO{
		@Autowired
		private SqlSessionTemplate sqlsession;
	
		
		public void setSqlsession(SqlSessionTemplate sqlsession) {
			this.sqlsession = sqlsession;
		}
		
		public AuctionDaoImp() {
			// TODO Auto-generated constructor stub
		}

		@Override
		public int count() {
			// TODO Auto-generated method stub
			return sqlsession.selectOne("auction.count");
		}

		@Override
		public List<AuctionDTO> auctionListMethod(PageDTO pageDto) {
			return sqlsession.selectList("auction.List", pageDto);
		}

		@Override
		public AuctionDTO auctionView(int num) {
			return sqlsession.selectOne("auction.view", num);
		}

		@Override
		public void au_recipeInsertMethod(Au_recipeDTO au_dto) {
			sqlsession.insert("auction.recipe", au_dto);
			sqlsession.update("auction.ctpriceUpdate",au_dto);
		}

		@Override
		public void auctionInsertMethod(AuctionDTO adto) {
				sqlsession.insert("auction.auctionIns", adto);
		}

		@Override
		public void stateUpdateMethod(int auctioncode) {
				sqlsession.update("auction.stateUpd",auctioncode);
		}

		@Override
		public int auctionSuccesfulMethod(int auctioncode) {
			System.out.println("dao옥션코드"+auctioncode);
			Integer code = sqlsession.selectOne("auction.Successful", auctioncode);
			
			if(code == null) {
				code = 0;
			}
			
			return code;
		}

		@Override
		public UserDTO successfulUserMethod(int usercode) {
			// TODO Auto-generated method stub
			return sqlsession.selectOne("auction.successfuluser", usercode);
		}

		@Override
		public List<Au_recipeDTO> aureListMethod(int auctioncode) {
			// TODO Auto-generated method stub
			return sqlsession.selectList("auction.aurelist", auctioncode);
		}
		
		@Override
		public void finNameProcess(Au_recipeDTO rdto) {
			sqlsession.update("auction.finnameUpd", rdto);
		}

		@Override
		public void auctionUserMileageminus(AuctionDTO aucdto) {
			//낙찰자 마일리지 감소
			sqlsession.update("auction.mileageMinus", aucdto);
			
		}

		@Override
		public UserDTO auctionTotalMileage(int usercode) {
			//낙찰자 경매 판매자 총마일리지 가져오기
			return sqlsession.selectOne("auction.userselect", usercode);
		}

		@Override
		public void mileageAddMethod(MileageDTO mdto) {
			sqlsession.insert("auction.MileageAdd", mdto);
		}

		@Override
		public void sellerMilPlusMethod(AuctionDTO aucdto) {
			sqlsession.update("auction.sellerMilPlus", aucdto);
		}
		
	
}
