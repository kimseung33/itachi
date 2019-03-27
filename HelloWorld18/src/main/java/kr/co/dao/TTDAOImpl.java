package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.TTDTO;

@Repository
public class TTDAOImpl implements TTDAO{
	
	@Inject //인젝트를 해줘서 sqlSession은 null이 아님 스프링프레임워크에서 관리하는것 불러옴
	private SqlSession sqlSession;
	
	private final String NS="kr.co.mapper.tt";

	@Override
	public void insert(TTDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(NS+".insert", dto);
	}

	@Override
	public List<TTDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".list");
	}

}
