package kr.co.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	private final String NS="kr.co.mapper.user";
	
	@Override
	public void updatePoint(String userId, int userPoint) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPoint", userPoint);
		session.update(NS+".updatePoint",map);

	}

	@Override
	public UserVO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".login", dto);
	}

}
