package com.mycompany.gofarm.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

@Service
public class BoardDaoImp implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public BoardDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BoardDTO> board_list() {
		return sqlSession.selectList("board.all_list");
	}

	// 댓글 적고 저장
	@Override
	public void commentInstMethod(CommentsDTO cdto) {
		sqlSession.insert("board.c_insert", cdto);

	}

	// 댓글 뷰
	@Override
	public List<CommentsDTO> commentview(int boardcode) {
		return sqlSession.selectList("board.c_list", boardcode);
	}

	@Override
	public int count(String go) {
		return sqlSession.selectOne("board.boardcount", go);
	}

	@Override
	public List<BoardDTO> blist(PageDTO pdto) {

		return sqlSession.selectList("board.blist", pdto);
	}

	@Override
	public void insert_board(BoardDTO dto) {
		sqlSession.insert("board.b_insert", dto);

	}

	@Override
	public int bcount(int usercode) {
		return sqlSession.selectOne("board.busercodecount", usercode);
	}

	@Override
	public BoardDTO bcontent(int boardcode) {
		return sqlSession.selectOne("board.bview", boardcode);
	}
}
