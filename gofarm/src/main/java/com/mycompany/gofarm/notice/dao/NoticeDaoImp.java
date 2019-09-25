package com.mycompany.gofarm.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.gofarm.notice.dto.NoticeDTO;
import com.mycompany.gofarm.notice.dto.PageDTO;

@Repository
public class NoticeDaoImp implements NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public NoticeDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int n_count() {
		return sqlSession.selectOne("notice.n_count");
	}

	@Override
	public int noticount(int usercode) {
		return sqlSession.selectOne("notice.noti_count");
	}

	@Override
	public List<NoticeDTO> n_list(PageDTO pv) {
		return sqlSession.selectList("notice.n_list", pv);
	}

	@Override
	public NoticeDTO n_content(int noticecode) {
		return sqlSession.selectOne("notice.n_cont", noticecode);
	}

	@Override
	public void n_insert(NoticeDTO dto) {
		sqlSession.insert("notice.n_insert", dto);

	}

	@Override
	public void n_delete(int noticecode) {
		sqlSession.delete("notice.n_delete", noticecode);

	}

	@Override
	public String getFile(int noticecode) {
		return sqlSession.selectOne("notice.n_file", noticecode);

	}

}
