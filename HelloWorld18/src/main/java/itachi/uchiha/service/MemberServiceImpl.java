package itachi.uchiha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itachi.uchiha.dao.MemberDAO;
import itachi.uchiha.domain.MemberDTO;



@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public void insert(MemberDTO dto) {
		dao.insert(dto);

	}

	@Override
	public List<MemberDTO> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

	@Override
	public MemberDTO selectById(int id) {
		return dao.selectById(id);
	}

	@Override
	public MemberDTO updateui(int id) {
		return dao.updateui(id);
	}

	@Override
	public void update(MemberDTO dto) {

		dao.update(dto);

	}

	@Override
	public void delete(int id) {
 
		dao.delete(id);
	}

}