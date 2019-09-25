package com.mycompany.gofarm.board.dao;

import java.util.List;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

public interface BoardDAO {

	// 자유 게시판 리스트
	public List<BoardDTO> board_list();

	// 자유 게시판 글 목록 개수
	public int count();

	// 댓글 저장
	public void commentInstMethod(CommentsDTO cdto);

	// 댓글 수정
	public void commentUpMethod(CommentsDTO rdto);

	// 댓글 뷰
	public List<CommentsDTO> commentview(int cnum);

	// 댓글 삭제
	public void commentDelMethod(int commentcode);

	public int count(String go);

	public List<BoardDTO> blist(PageDTO pdto);

	// 자유게시판 글 인서트
	public void insert_board(BoardDTO dto);

	// 세션 유무
	public int bcount(int usercode);

	// 자유 게시판 상세 페이지
	public BoardDTO bcontent(int boardcode);

	// 자유게시판 수정시 받아오는 번호
	public BoardDTO update_boardNum(int boardcode);

	// 자유게시판 수정
	public void update_board(BoardDTO dto);

	// 파일첨부 값 받기
	public String getFile(int boardcode);

	// 자유게시판 글 삭제
	public void delete_board(int boardcode);

}
