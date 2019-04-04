package itachi.uchiha.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import kr.co.function.CheckNumberGenerator2;



@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String NS="itachi.uchiha.mapper.board";
	
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
	
	
	
}
