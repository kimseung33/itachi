package itachi.uchiha.dao;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

public interface MemberDAO {
	MemberDTO login(LoginDTO dto);
	String findId(MemberDTO dto);	
	MemberDTO updateUI(String id);
	void update(MemberDTO dto);
	void insert(MemberDTO dto);

}

