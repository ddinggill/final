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
	
	//댓글
	@Override
	public List<CommentsDTO> replyListProcess(CommentsDTO cdto) {
		boardDAO.commentInstMethod(cdto);
		return boardDAO.commentview(cdto.getBoardcode());
	}
	
	@Override
	public List<CommentsDTO> commentList(int boardcode) {
		return boardDAO.commentview(boardcode);
	}

}
