package itachi.uchiha.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.ReceiptDTO;
import kr.co.function.CheckNumberGenerator;
import kr.co.function.MailExam;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private String NS = "itachi.uchiha.mapper.board";	
	
	@Override
	public void cashget(ReceiptDTO dto) {
		System.out.println("멤버dao에있는 cashget dto정상출력하는지 test"+dto+"::::::::::::::::::::");
		sqlSession.update(NS+".cashget", dto);	//구매자 계정에서 입찰금액 빼는 과정
		sqlSession.update(NS+".cashget2", dto);	//판매자 계정에 입찰금액 넣는 과정
		System.out.println("멤버dao에있는 cashget sqlsession작업끝남?"+dto+"::::::::::::::::::::");
	}

	@Override
	public ReceiptDTO cashgetui(int nowMoney, String productNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowMoney", nowMoney);
		map.put("productNumber", productNumber);
		System.out.println("moeny:::::::::::::"+nowMoney+":::::::::"+"number"+productNumber+":::::::");
		System.out.println("map::::::::::"+map+":::::::::::");
		return sqlSession.selectOne(NS+".cashgetui", map);
	}
	
	@Override
	public void cashback(MemberDTO dto) {
		
		sqlSession.update(NS+".cashback", dto);
	
	}
	
	@Override
	public MemberDTO readId(String id) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(NS+".readid", id);
	}
	
	@Override
	public void cash(MemberDTO dto) {

		sqlSession.update(NS+".cash", dto);
	}
	
	@Override
	public MemberDTO login(LoginDTO dto) {


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

	
}
