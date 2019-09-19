package com.mycompany.gofarm.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.review.dao.ReviewDAO;
import com.mycompany.gofarm.review.dto.ReviewDTO;

@Service
public class ReviewserviceImp implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	public ReviewserviceImp() {
		// TODO Auto-generated constructor stub
	}
	//리뷰글 데이터 저장
	@Override
	public void reviewInsProcess(ReviewDTO rdto) {
		reviewDao.reviewInsMethod(rdto);
	}
	//리뷰를 위한 정보 가져오기
	@Override
	public ReviewDTO reviewUpdProcess(int re_code) {
		// TODO Auto-generated method stub
		return reviewDao.reviewUpdMethod(re_code);
	}
	//리뷰업데이트 하기
	@Override
	public void reviewUpdateProProcess(ReviewDTO redto) {
		reviewDao.reviewUpdateProMethod(redto);
	}
	//삭제
	@Override
	public void reviewDeleteProcess(int re_code) {
		reviewDao.reviewDeleteMethod(re_code);
	}
	
	
	
	
	
}
