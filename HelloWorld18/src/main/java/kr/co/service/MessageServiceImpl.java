package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.MessageDAO;
import kr.co.dao.UserDAO;
import kr.co.domain.MessageVO;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {
	
	@Inject
	private MessageDAO mdao;
	
	@Inject
	private UserDAO udao;
	
	@Override
	public void create(MessageVO vo) {
		mdao.create(vo);
		udao.updatePoint(vo.getSender(),10);
	}
	//메세지 생성 + 보내는 user에게 point지급
	@Override
	public MessageVO readMessage(int mid,String userId) {
		mdao.updateState(mid);
		udao.updatePoint(userId, 5);
		return mdao.readMessage(mid);
	}
	//메세지 읽기 +읽는 user에게 point 지급 +openDate 수정
	@Override
	public void updateState(int mid, String userId) {
		
		
	}

	
	

}
	