package itachi.uchiha.dao;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

public interface MemberDAO {
	MemberDTO login(LoginDTO dto);
	String findIde(String name,String email);	
	String findIdh(String name,String birth,int hp);	
	MemberDTO updateUI(String id);
	void update(MemberDTO dto);
	void insert(MemberDTO dto);
	String idCheck (String id);
}

