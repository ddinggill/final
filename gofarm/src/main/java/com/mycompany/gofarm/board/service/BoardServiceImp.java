package com.mycompany.gofarm.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.board.dao.BoardDAO;
import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	public BoardServiceImp() {

	}

	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public List<BoardDTO> board_allProcess() {
		return boardDAO.board_list();
	}

	@Override
	public int countProcess() {
		return boardDAO.count();
	}

	@Override
	public int boardcount(String go) {
		return boardDAO.count(go);
	}

	@Override
	public List<BoardDTO> boardlistProcess(PageDTO pdto) {
		return boardDAO.blist(pdto);
	}

	@Override
	public void insert_boardProcess(BoardDTO dto) {

		boardDAO.insert_board(dto);

	}

	@Override
	public int bcountProcess(int usercode) {
		return boardDAO.bcount(usercode);
	}

	@Override
	public BoardDTO contentProcess(int boardcode) {
		return boardDAO.bcontent(boardcode);
	}

	// 댓글
	@Override
	public List<CommentsDTO> replyListProcess(CommentsDTO cdto) {
		boardDAO.commentInstMethod(cdto);
		return boardDAO.commentview(cdto.getBoardcode());
	}

	@Override
	public List<CommentsDTO> replyUpProcess(CommentsDTO rdto) {
		boardDAO.commentUpMethod(rdto);
		return boardDAO.commentview(rdto.getBoardcode());
	}

	@Override
	public List<CommentsDTO> commentList(int boardcode) {
		return boardDAO.commentview(boardcode);
	}

	@Override
	public void replyDelProcess(int commentcode) {
		boardDAO.commentDelMethod(commentcode);

	}

	@Override
	public BoardDTO updatenumProcess(int boardcode) {
		return boardDAO.update_boardNum(boardcode);
	}

	@Override
	public void bupdateProcess(BoardDTO dto) {
		boardDAO.update_board(dto);

	}

	@Override
	public String fileSelectProcess(int boardcode) {
		return boardDAO.getFile(boardcode);
	}

	@Override
	public void bdeleteProcess(int boardcode) {

		boardDAO.delete_board(boardcode);
	}

}
