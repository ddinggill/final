package com.mycompany.gofarm.review.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.review.dto.ReviewDTO;

@Repository
public class ReviewDaoImp implements ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public void setSqlsession(SqlSessionTemplate sqlsession) {
		this.sqlsession = sqlsession;
	}
	public ReviewDaoImp() {
		// TODO Auto-generated constructor stub
	}
	//리뷰글 데이터 저장
	@Override
	public void reviewInsMethod(ReviewDTO rdto) {
		sqlsession.insert("review.reviewIns", rdto);
	}
	//리뷰를 위한 정보 가져오기
	@Override
	public ReviewDTO reviewUpdMethod(int re_code) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("review.reviewUpdForm", re_code);
	}
	//리뷰업데이트 하기
	@Override
	public void reviewUpdateProMethod(ReviewDTO redto) {
		sqlsession.update("review.reviewUpdPro", redto);
	}
	//리뷰 삭제
	@Override
	public void reviewDeleteMethod(int re_code) {
		sqlsession.delete("review.reviewDel", re_code);
	}
	
	
	
	
}
