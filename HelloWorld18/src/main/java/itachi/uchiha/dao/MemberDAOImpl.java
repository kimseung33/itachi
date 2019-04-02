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
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private String NS = "itachi.uchiha.mapper.board";

	@Override
	public MemberDTO login(LoginDTO dto) {
		HttpSession session = null;
		System.out.println(dto+":::::::::::::::::::::::::::::::::::::::");
		
		return sqlSession.selectOne(NS+".login", dto);
		

	}

	
	@Override
	public MemberDTO updateUI(String id) {

		return sqlSession.selectOne(NS + ".updateui", id);

	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update(NS + ".update", dto);
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert(NS + ".insert", dto);
	}

	@Override
	public String idCheck(String id) {
		return sqlSession.selectOne(NS + ".idCheck", id);
	}


	@Override
	public String findId(String mb_Email, String mb_Name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mb_Name", mb_Name);
		map.put("mb_Email", mb_Email);
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".findid", map);
	}


	@Override
	public String emailCheck(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".emailCheck", email);
	}

}
