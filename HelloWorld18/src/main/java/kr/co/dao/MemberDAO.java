package kr.co.dao;

import java.util.List;

import kr.co.domain.MemberDTO;

public interface MemberDAO {

	
	public void insert(MemberDTO dto);
	public List<MemberDTO> select();
	public MemberDTO selectById(int id);
	public MemberDTO updateui(int id);
	public void update(MemberDTO dto);
	public void delete(int id);

	
	
}
