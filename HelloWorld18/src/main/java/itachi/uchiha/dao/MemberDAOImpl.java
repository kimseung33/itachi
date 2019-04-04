package itachi.uchiha.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import itachi.uchiha.domain.LoginDTO;

import itachi.uchiha.domain.MemberDTO;

import itachi.uchiha.domain.SellDTO;

import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import kr.co.function.CheckNumberGenerator;
import kr.co.function.CheckNumberGenerator2;
import kr.co.function.MailExam;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private String NS = "itachi.uchiha.mapper.board";

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return sqlSession.selectOne(NS + ".getSearchAmount", cri);
	}

	@Override
	public List<RegistrationDTO> search(SearchCriteria cri) {
		return sqlSession.selectList(NS + ".search", cri);
	}

	@Override
	public void registration(RegistrationDTO dto2) {

		switch (dto2.getCategory()) {
		case "clothing":
			dto2.setProductNumber("A" + CheckNumberGenerator2.checknumber());
			System.out.println("A번쨰 기본키입니다.");
			break;
		case "beauty":
			dto2.setProductNumber("B" + CheckNumberGenerator2.checknumber());
			break;
		case "merchandise":
			dto2.setProductNumber("C" + CheckNumberGenerator2.checknumber());
			break;
		case "appliances":
			dto2.setProductNumber("D" + CheckNumberGenerator2.checknumber());
			break;
		case "bookorticket":
			dto2.setProductNumber("E" + CheckNumberGenerator2.checknumber());
			break;

		default:
			System.out.println("제품번호 생성기 항목에따른 번호 안넘어온듯합니다~");
			dto2.setProductNumber("F" + CheckNumberGenerator2.checknumber());
			break;
		}

		System.out.println("daoImpl dto확인" + dto2 + ":::::::::::::::::::::::::::::::::::::::");
		sqlSession.insert(NS + ".registration", dto2);
		sqlSession.update(NS + ".registration2", dto2);
	}

	@Override
	public MemberDTO login(LoginDTO dto) {

		System.out.println(":MemberDAOImpl:::login:" + dto.getMb_Id() + ":" + dto.getMb_Pw());

		return sqlSession.selectOne(NS + ".login", dto);

	}

	@Override
	public void selectpw(MemberDTO dto) {
		String email = dto.getMb_Email();

		String sentence = CheckNumberGenerator.checknumber();
		MailExam.main(email, sentence);
		dto.setMb_Pw(sentence); // 임시비밀번호 넣음

		sqlSession.update(NS + ".selectpw", dto);
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
		return sqlSession.selectOne(NS + ".findid", map);
	}

	@Override
	public String emailCheck(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".emailCheck", email);
	}

	@Override
	public void insertin(SellDTO dto) {
		sqlSession.insert(NS + ".sellin", dto);

	}

}
