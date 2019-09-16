package com.mycompany.gofarm.product.dao;

import java.util.List;

import com.mycompany.gofarm.product.dto.DealDTO;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.dto.ReviewDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface ProductDAO {
	
	public int count();
	public List<ProductDTO> productListMethod(PageDTO pageDto);
	public ProductDTO productView(int num);
	public void productDealMethod(DealDTO dto);
	public UserDTO userInfoMethod(int usercode);
	public UserDTO detailInfoMethod(int usercode);
	public void productInsertMethod(ProductDTO prodto);
	public void productUpdateMethod(ProductDTO prodto);
	public void productDeleteMethod(int prod_code);
	public List<ReviewDTO> reviewListMethod(int prod_code);
	
}
