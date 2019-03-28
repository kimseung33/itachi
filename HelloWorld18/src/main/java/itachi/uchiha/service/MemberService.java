package itachi.uchiha.service;

import java.util.List;

import itachi.uchiha.domain.MemberDTO;



public interface MemberService {

	public void insert(MemberDTO dto);
	public List<MemberDTO> select();
	public MemberDTO selectById(int id);
	public MemberDTO updateui(int id);
	public void update(MemberDTO dto);
	public void delete(int id);
	
}
