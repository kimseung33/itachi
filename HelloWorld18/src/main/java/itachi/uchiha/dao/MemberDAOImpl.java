package itachi.uchiha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;



@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS="?";

	@Override
	public MemberDTO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}
