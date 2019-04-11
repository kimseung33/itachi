package itachi.uchiha.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

import itachi.uchiha.domain.SellDTO;

import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;

public interface MemberService {

	MemberDTO login(LoginDTO dto);

	String findId(String mb_Email, String mb_Name, HttpServletResponse response) throws Exception;

	MemberDTO updateui(String id);

	void update(MemberDTO dto);

	void insert(MemberDTO dto);

	String idCheck(String id);

	String emailCheck(String email);

	void selectpw(MemberDTO dto);


	void cash(MemberDTO dto);
	
	MemberDTO readId(String id);


}
