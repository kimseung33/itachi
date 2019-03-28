package itachi.uchiha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itachi.uchiha.dao.MemberDAO;
import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberDTO login(LoginDTO dto) {
		return dao.login(dto);
	}

	@Override
	public String findId(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.findId(dto);
	}
}
