package kr.co.ca;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.MessageDAO;
import kr.co.domain.MessageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MessageDAOTest {

	@Inject
	private MessageDAO dao;

	@Test
	public void testCreate() {
		MessageVO vo =new MessageVO(1,"user1","user2","what",null,null);
		dao.create(vo);
	}
	
	@Test
	public void testRead() {
		MessageVO vo=dao.readMessage(1);
		System.out.println(vo);
	}
}
