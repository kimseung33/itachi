package itachi.uchiha.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itachi.uchiha.dao.MemberDAO;
import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.SellDTO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public MemberDTO login(LoginDTO dto) {

		return dao.login(dto);
	}

	@Override
	public MemberDTO updateui(String id) {

		return dao.updateUI(id);
	}

	@Override
	public void update(MemberDTO dto) {
		dao.update(dto);
	}

	@Override
	public void insert(MemberDTO dto) {
		dao.insert(dto);
	}

	@Override
	public String idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public String findId(String mb_Email, String mb_Name, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.findId(mb_Email, mb_Name);

		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public String emailCheck(String email) {
		// TODO Auto-generated method stub
		return dao.emailCheck(email);
	}

	@Override
	public void insertin(SellDTO dto) {
		// TODO Auto-generated method stub
		dao.insertin(dto);
	}

}
