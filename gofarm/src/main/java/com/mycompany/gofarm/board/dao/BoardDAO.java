package com.mycompany.gofarm.board.dao;

import java.util.List;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

public interface BoardDAO {

	// 자유 게시판 리스트
	public List<BoardDTO> board_list();

	// 댓글 저장
	public void commentInstMethod(CommentsDTO cdto);

	// 댓글 뷰
	public List<CommentsDTO> commentview(int cnum);

	public int count(String go);

	public List<BoardDTO> blist(PageDTO pdto);

	// 자유게시판 글 인서트
	public void insert_board(BoardDTO dto);

	// 세션 유무
	public int bcount(int usercode);

	// 자유 게시판 상세 페이지
	public BoardDTO bcontent(int boardcode);

}
