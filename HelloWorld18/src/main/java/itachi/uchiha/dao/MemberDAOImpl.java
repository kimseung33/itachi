package itachi.uchiha.dao;


import javax.inject.Inject;

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
		return sqlSession.selectOne(NS+".login", dto);
	}

	@Override
	public String findId(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".selectid", dto);
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
