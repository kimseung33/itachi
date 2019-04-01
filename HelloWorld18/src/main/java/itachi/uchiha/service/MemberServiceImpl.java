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
	public String findIde(String name,String email) {
		// TODO Auto-generated method stub
		return dao.findIde(name,email);
	}
	
	@Override
	public String findIdh(String name, String birth, int hp) {
		// TODO Auto-generated method stub
		return dao.findIdh(name, birth, hp);
	}
	
	@Override
	public MemberDTO updateui(String id) {
		
		return dao.updateUI(id);
	}

	@Override
	public void update(MemberDTO dto) {
		dao.update(dto);
	}
	
	@Override
	public void insert(MemberDTO dto) {
		dao.insert(dto);
	}


	@Override
	public String idCheck(String id) {
		 return dao.idCheck(id);
	}

}
