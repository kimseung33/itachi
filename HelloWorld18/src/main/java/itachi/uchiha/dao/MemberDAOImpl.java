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
	
	private String NS="kr.co.mapper.board";

	@Override
	public MemberDTO login(LoginDTO dto) {
		
		return sqlSession.selectOne(NS+".login", dto);
	}
	



	

	
}
