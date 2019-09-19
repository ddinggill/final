package com.mycompany.gofarm.board.service;

import java.util.List;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

public interface BoardService {

	public List<BoardDTO> board_allProcess();

	// 댓글저장과 동시에 화면에 표시
	public List<CommentsDTO> replyListProcess(CommentsDTO cdto);

	public int boardcount(String go);

	public List<BoardDTO> boardlistProcess(PageDTO pdto);

	public void insert_boardProcess(BoardDTO dto);

	public int bcountProcess(int usercode); // 중복확인

	public BoardDTO contentProcess(int boardcode);

	// 해당하는 글의 댓글 리스트 출력
	public List<CommentsDTO> commentList(int boardcode);
}
