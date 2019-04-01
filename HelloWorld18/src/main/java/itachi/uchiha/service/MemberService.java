package itachi.uchiha.service;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;



public interface MemberService {

	MemberDTO login(LoginDTO dto);
	String findId(MemberDTO dto);
	MemberDTO updateui(String id);
	void update(MemberDTO dto);
	void insert(MemberDTO dto);
	String idCheck(String id);

}
