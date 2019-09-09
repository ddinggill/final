package com.mycompany.gofarm.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
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



		
	
	
	
}
