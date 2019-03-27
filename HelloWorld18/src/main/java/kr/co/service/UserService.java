package kr.co.service;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

public interface UserService {
	void updatePoint(String userId,int userPoint);
	UserVO login(LoginDTO dto);
}
