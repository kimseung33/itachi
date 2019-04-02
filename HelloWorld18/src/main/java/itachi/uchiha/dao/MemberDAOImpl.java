package itachi.uchiha.dao;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import itachi.uchiha.domain.LoginDTO;


import itachi.uchiha.domain.MemberDTO;



@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private String NS="itachi.uchiha.mapper.board";
	
	
	@Override
	public MemberDTO login(LoginDTO dto) {
		HttpSession session = null;
		
		return sqlSession.selectOne(NS+".login", dto);
		
	}

	@Override
	public String findIde(String name,String email) {
		// TODO Auto-generated method stub
		Map<String , Object> map =new HashMap<String, Object>();
		map.put("mb_Name", name);
		map.put("mb_Email", email);
		
		return sqlSession.selectOne(NS+".selectide",map);
	}
	
	@Override
	public String findIdh(String name, String birth, int hp) {
		// TODO Auto-generated method stub
		Map<String , Object> map =new HashMap<String, Object>();
		map.put("mb_Name", name);
		map.put("mb_Birth", birth);
		map.put("mb_Hp", hp);
		return sqlSession.selectOne(NS+".selectidh", map);
	}
	
	@Override
	public MemberDTO updateUI(String id) {
		
		return sqlSession.selectOne(NS+".updateui", id);
		
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update(NS+".update", dto);
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert(NS+".insert", dto);
	}


	@Override
	public String idCheck(String id) {
		return sqlSession.selectOne(NS+".idCheck", id);
	}

	

	
}
