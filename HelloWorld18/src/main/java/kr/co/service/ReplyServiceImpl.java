package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ReplyDAO;
import kr.co.domain.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	
	@Override
	public void insert(ReplyVO vo) {
		dao.insert(vo);
	}


	@Override
	public List<ReplyVO> list(int bno) {
		return dao.list(bno);
	}


	@Override
	public void update(ReplyVO vo) {
		
		dao.update(vo);
	}


	@Override
	public void delete(int rno) {

		dao.delete(rno);
	}


	@Override
	public int getAmount(Integer bno) {
		return dao.getAmount(bno);
		
	}


	@Override
	public List<ReplyVO> list(int bno, int page) {		
		return dao.list(bno, page);
	}

}
