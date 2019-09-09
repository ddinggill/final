package com.mycompany.gofarm.product.service;

import java.util.List;

import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;

public interface ProductService {

	
	public int countProcess();
	public List<ProductDTO> productListService();
	public ProductDTO productViewProcess(int num);
	List<ProductDTO> productListService(PageDTO pageDto);
	
	
	
	
}
