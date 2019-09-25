package com.mycompany.gofarm.notice.service;

import java.util.List;

import com.mycompany.gofarm.notice.dto.NoticeDTO;
import com.mycompany.gofarm.notice.dto.PageDTO;

public interface NoticeService {

	public int n_countProcess();

	public int noti_countProcess(int usercode);

	public List<NoticeDTO> notice_listProcess(PageDTO pv);

	public NoticeDTO notice_contProcess(int noticecode);

	public void notice_insertProcess(NoticeDTO dto);

	public void bdeleteProcess(int noticecode);

	public String fileSelectProcess(int noticecode);

}
