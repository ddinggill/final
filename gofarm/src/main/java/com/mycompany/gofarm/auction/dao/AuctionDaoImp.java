package com.mycompany.gofarm.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.auction.dto.Au_recipeDTO;
import com.mycompany.gofarm.auction.dto.AuctionDTO;
import com.mycompany.gofarm.auction.dto.PageDTO;

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
		
		
	
	
}
