package itachi.uchiha.dao;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.SellDTO;

public interface MemberDAO {
	MemberDTO login(LoginDTO dto);

	MemberDTO updateUI(String id);

	void update(MemberDTO dto);

	void insert(MemberDTO dto);

	String idCheck(String id);

	String findId(String mb_Email, String mb_Name);

	String emailCheck(String email);
	
	void insertin(SellDTO dto);
}
