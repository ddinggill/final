package com.mycompany.gofarm.notice.dao;

import java.util.List;

import com.mycompany.gofarm.job.dto.JobDTO;
import com.mycompany.gofarm.notice.dto.NoticeDTO;
import com.mycompany.gofarm.notice.dto.PageDTO;

public interface NoticeDAO {

	// 공지게시판 총 개수
	public int n_count();

	// 공지게시판 usercode
	public int noticount(int usercode);

	// 공지게시판 리스트
	public List<NoticeDTO> n_list(PageDTO pv);

	// 공지게시판 상세뷰
	public NoticeDTO n_content(int noticecode);

	// 공지 글쓰기 폼
	public void n_insert(NoticeDTO dto);

	// 공지 삭제
	public void n_delete(int noticecode);

	// 파일첨부 값 받기
	public String getFile(int noticecode);

}
