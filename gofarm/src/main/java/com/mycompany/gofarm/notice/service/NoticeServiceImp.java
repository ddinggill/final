package com.mycompany.gofarm.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.gofarm.notice.dao.NoticeDAO;
import com.mycompany.gofarm.notice.dto.NoticeDTO;
import com.mycompany.gofarm.notice.dto.PageDTO;

@Service
public class NoticeServiceImp implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	public NoticeServiceImp() {

	}

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public int n_countProcess() {
		return noticeDAO.n_count();
	}

	@Override
	public int noti_countProcess(int usercode) {
		return noticeDAO.noticount(usercode);
	}

	@Override
	public List<NoticeDTO> notice_listProcess(PageDTO pv) {
		return noticeDAO.n_list(pv);
	}

	@Override
	public NoticeDTO notice_contProcess(int noticecode) {
		return noticeDAO.n_content(noticecode);
	}

	@Override
	public void notice_insertProcess(NoticeDTO dto) {
		noticeDAO.n_insert(dto);

	}

	@Override
	public void bdeleteProcess(int noticecode) {
		noticeDAO.n_delete(noticecode);
		
	}

	@Override
	public String fileSelectProcess(int noticecode) {
		return noticeDAO.getFile(noticecode);
	}

}
