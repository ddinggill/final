package com.mycompany.gofarm.mypage.service;

import java.util.List;

import com.mycompany.gofarm.mypage.dto.MileageDTO;
import com.mycompany.gofarm.user.dto.UserDTO;

public interface MypageService {
	public List<MileageDTO> mileageListService(int usercode);
	public List<MileageDTO> paymentListService(int usercode);
	public MileageDTO mileageViewService(int usercode);
	public void mileageInsertService(MileageDTO dto);
	public void mileageUpdateService(MileageDTO dto);
	public UserDTO userDetailViewService(int usercode);
}
