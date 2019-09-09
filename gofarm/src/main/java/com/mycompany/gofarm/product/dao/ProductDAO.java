package com.mycompany.gofarm.product.dao;

import java.util.List;

import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;

public interface ProductDAO {
	
	public int count();
	public List<ProductDTO> productListMethod(PageDTO pageDto);
	public ProductDTO productView(int num);
	
	
	
	
	
	
}
