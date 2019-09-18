package com.mycompany.gofarm.product.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.product.dto.DealDTO;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.dto.ReviewDTO;
import com.mycompany.gofarm.user.dto.UserDTO;
@Repository
public class ProductDaoImp  implements ProductDAO{
		@Autowired
		private SqlSessionTemplate sqlsession;
	
		public void setSqlsession(SqlSessionTemplate sqlsession) {
			this.sqlsession = sqlsession;
		}
		
		
	
		public ProductDaoImp() {
		}

		@Override
		public List<ProductDTO> productListMethod(PageDTO pageDto) {
			return sqlsession.selectList("product.list", pageDto);
		}



		@Override
		public int count() {
			return sqlsession.selectOne("product.count");
		}



		@Override
		public ProductDTO productView(int prod_code) {
			return sqlsession.selectOne("product.view", prod_code);
		}



		@Override
		public void productDealMethod(DealDTO dto) {
			sqlsession.insert("product.deal", dto);
			
			//ProductDTO prodto = sqlsession.selectOne("product.view", dto);
			//int price;
			//price = prodto.getPd_price() * dto.getDe_cnt();
			//Map<String,Integer> map = new HashMap<String, Integer>();
			//map.put("price", price);
			//map.put("usercode", dto.getDe_usercode());
			
			//sqlsession.update("product.dealresult", map);
			sqlsession.update("product.product_cnt", dto);
		}



		@Override
		public UserDTO userInfoMethod(int usercode) {
			return sqlsession.selectOne("product.userinfo", usercode);
		}



		@Override
		public UserDTO detailInfoMethod(int usercode) {
			return sqlsession.selectOne("product.detailinfo", usercode);
		}



		@Override
		public void productInsertMethod(ProductDTO prodto) {
			sqlsession.insert("product.productIns", prodto);
		}



		@Override
		public void productUpdateMethod(ProductDTO prodto) {
			sqlsession.update("product.productUpd", prodto);
		}



		@Override
		public void productDeleteMethod(int prod_code) {
			sqlsession.delete("product.productDel", prod_code);
		}



		@Override
		public List<ReviewDTO> reviewListMethod(int prod_code) {
			return sqlsession.selectList("product.reviewList", prod_code);	
		}



		@Override
		public void mileageInsertMethod(MileageDTO dto) {
			sqlsession.insert("product.mileage_insert", dto);
			
		}

		@Override
		public MileageDTO mileageViewMethod(int usercode) {
			return sqlsession.selectOne("product.mileage_view", usercode);
		}

		@Override
		public void mileageUpdateMethod(MileageDTO dto) {
			sqlsession.update("product.mileage_update", dto);
		}



		
	
	
	
}
