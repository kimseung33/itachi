package itachi.uchiha.service;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;



public interface MemberService {

	MemberDTO login(LoginDTO dto);
	
}
