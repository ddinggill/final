package com.mycompany.gofarm.board.service;

import java.util.List;

import com.mycompany.gofarm.board.dto.BoardDTO;
import com.mycompany.gofarm.board.dto.CommentsDTO;
import com.mycompany.gofarm.board.dto.PageDTO;

public interface BoardService {

	public List<BoardDTO> board_allProcess();

	public int countProcess();

	// 댓글저장과 동시에 화면에 표시
	public List<CommentsDTO> replyListProcess(CommentsDTO cdto);

	// 댓글 업데이트
	public List<CommentsDTO> replyUpProcess(CommentsDTO rdto);

	// 댓글 삭제
	public void replyDelProcess(int commentcode);

	public int boardcount(String go);

	public List<BoardDTO> boardlistProcess(PageDTO pdto);

	public void insert_boardProcess(BoardDTO dto);

	public int bcountProcess(int usercode); // 중복확인

	public BoardDTO contentProcess(int boardcode);

	public BoardDTO updatenumProcess(int boardcode);

	public void bupdateProcess(BoardDTO dto);

	public String fileSelectProcess(int boardcode);

	public void bdeleteProcess(int boardcode);

	// 해당하는 글의 댓글 리스트 출력
	public List<CommentsDTO> commentList(int boardcode);
}
