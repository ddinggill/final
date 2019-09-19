package com.mycompany.gofarm.review.service;

import com.mycompany.gofarm.review.dto.ReviewDTO;

public interface ReviewService {

	
	//리뷰글 데이터 저장
	public void reviewInsProcess(ReviewDTO rdto);
	//리뷰글 업데이트를 위한 정보 가져오기
	public ReviewDTO reviewUpdProcess(int re_code);
	//리뷰글 업데이트 하기
		public void reviewUpdateProProcess(ReviewDTO redto);
		//리뷰글 삭제하기
		public void reviewDeleteProcess(int re_code);
	
}
