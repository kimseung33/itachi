package itachi.uchiha.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import kr.co.function.CheckNumberGenerator2;



@Repository
public class BoardDAOImpl implements BoardDAO {
	
	
	@Inject
	private SqlSession sqlSession;
	
	private String NS="itachi.uchiha.mapper.board";
	
	
	@Override
	public void addAttach(String fullName, String productNumber) {
		int id=getAt_id();
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("at_id", id);
		map.put("fullName",fullName);
		map.put("productNumber", productNumber);
		sqlSession.insert(NS+".addAttach", map);
		
	}
	
	private int getAt_id() {
		Integer at_id= sqlSession.selectOne(NS+".getAt_id");
		if(at_id==null) {
			at_id=0;
		}
		return ++at_id;
	}



	@Override
	public List<String> getAttach(String productNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".getAttach",productNumber);
	}
	
	
	@Override
	public void registration(RegistrationDTO dto2) {
		
		switch (dto2.getCategory()) {
		case "clothing":
			dto2.setProductNumber("A"+CheckNumberGenerator2.checknumber());
			System.out.println("A번쨰 기본키입니다.");
			break;
		case "beauty":
			dto2.setProductNumber("B"+CheckNumberGenerator2.checknumber());
			break;
		case "merchandise":
			dto2.setProductNumber("C"+CheckNumberGenerator2.checknumber());
			break;
		case "appliances":
			dto2.setProductNumber("D"+CheckNumberGenerator2.checknumber());
			break;
		case "bookorticket":
			dto2.setProductNumber("E"+CheckNumberGenerator2.checknumber());
			break;
			
		default:
			System.out.println("제품번호 생성기 항목에따른 번호 안넘어온듯합니다~");
			dto2.setProductNumber("F"+CheckNumberGenerator2.checknumber());
			break;
		}
		
	
		
		System.out.println("daoImpl dto확인"+dto2+":::::::::::::::::::::::::::::::::::::::");
		sqlSession.insert(NS+".registration",dto2);
		sqlSession.update(NS+".registration2", dto2);
	}
	
	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+".getSearchAmount",cri);
	}
	
	@Override
	public List<RegistrationDTO> search(SearchCriteria cri) {
		return sqlSession.selectList(NS+".search", cri);
	}

	@Override
	public MemberDTO writeui(String id) {
		// TODO Auto-generated method stub
		System.out.println(id+"디에이오임플아이딘마와라");
		return sqlSession.selectOne(NS+".writeui", id);
	}
	
	
	
}
