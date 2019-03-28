package itachi.uchiha.dao;

import java.util.List;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

public interface MemberDAO {
	MemberDTO login(LoginDTO dto);
}
