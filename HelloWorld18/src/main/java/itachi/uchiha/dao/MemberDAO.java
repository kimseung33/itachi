package itachi.uchiha.dao;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

public interface MemberDAO {
	MemberDTO login(LoginDTO dto);	
	MemberDTO updateUI(String id);
	void update(MemberDTO dto);
	void insert(MemberDTO dto);
	String idCheck (String id);
	String findId(String mb_Email, String mb_Name);

}

