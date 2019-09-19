package com.mycompany.gofarm.review.dao;

import com.mycompany.gofarm.review.dto.ReviewDTO;

public interface ReviewDAO {
	
	//리뷰글 데이터 저장
	public void reviewInsMethod(ReviewDTO rdto);
	//리뷰글 업데이트를 위한 정보 가져오기
	public ReviewDTO reviewUpdMethod(int re_code);
	//리뷰글 업데이트 하기
	public void reviewUpdateProMethod(ReviewDTO redto);
	//리뷰글 삭제하기
	public void reviewDeleteMethod(int re_code);
	
	
	
}
