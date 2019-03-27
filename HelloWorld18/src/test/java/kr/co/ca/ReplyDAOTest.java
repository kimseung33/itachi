package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.BoardDAO;
import kr.co.dao.ReplyDAO;
import kr.co.domain.BoardVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

	

	@Test
	public void repinsert() {
		ReplyVO vo = new ReplyVO(0, 53, "안녕", "나야",null, null);
		dao.insert(vo);

	}
	
	@Test
	public void listtest() {
		List<ReplyVO> list = dao.list(53);
		for(ReplyVO vo:list) {
		System.out.println(vo);
		}
	}
	
	
	@Test
	public void updatest() {
		ReplyVO vo = new ReplyVO(13, 54, "기모띠", null, null,null);
		dao.update(vo);
		
	}
	
}
