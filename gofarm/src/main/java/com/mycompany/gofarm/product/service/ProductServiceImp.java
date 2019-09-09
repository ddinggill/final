package com.mycompany.gofarm.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.product.dao.ProductDAO;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	private ProductDAO productDao;
	
	public void setProductDao(ProductDAO productDao) {
		this.productDao = productDao;
	}
	
	
	public ProductServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	@Override
	public List<ProductDTO> productListService(PageDTO pageDto) {
		return productDao.productListMethod(pageDto);
	}


	@Override
	public int countProcess() {
		// TODO Auto-generated method stub
		return productDao.count();
	}


	@Override
	public ProductDTO productViewProcess(int prod_code) {
		return productDao.productView(prod_code);
	}


	@Override
	public List<ProductDTO> productListService() {
		// TODO Auto-generated method stub
		return null;
	}

}
