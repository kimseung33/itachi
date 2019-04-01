package itachi.uchiha.service;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;



public interface MemberService {

	MemberDTO login(LoginDTO dto);
	String findIde(String name,String email);
	String findIdh(String name, String birth, int hp );
	MemberDTO updateui(String id);
	void update(MemberDTO dto);
	void insert(MemberDTO dto);

}
