package com.mycompany.gofarm.user.service;


import com.mycompany.gofarm.user.dto.UserDTO;

public interface UserService {

	public void signupProcess(UserDTO dto);
	public void detailsignupProcess(UserDTO dto);
	public UserDTO loginCheckProcess(UserDTO dto);
	public UserDTO kakaologinProcess(UserDTO dto);
	public void updateProcess(UserDTO dto);
	public int idchkProcess(String userid);
}
