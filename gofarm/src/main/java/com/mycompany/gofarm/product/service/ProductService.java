package com.mycompany.gofarm.product.service;

import java.util.List;

import com.mycompany.gofarm.product.dto.DealDTO;
import com.mycompany.gofarm.product.dto.PageDTO;
import com.mycompany.gofarm.product.dto.ProductDTO;
import com.mycompany.gofarm.product.dto.ReviewDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface ProductService {

	
	public int countProcess();
	public List<ProductDTO> productListService();
	public ProductDTO productViewProcess(int num);
	public List<ProductDTO> productListService(PageDTO pageDto);
	public void productDealProcess(DealDTO dto);
	public UserDTO userInfoService(int usercode);
	public UserDTO detailInfoService(int usercode);
	public void productInsertService(ProductDTO prodto);
	public void productUpdateService(ProductDTO prodto);
	public void productDeleteService(int prod_code);
	public List<ReviewDTO> reviewListService(int prod_code);
	
	
}
