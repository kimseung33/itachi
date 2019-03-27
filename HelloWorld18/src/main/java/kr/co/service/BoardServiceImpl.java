package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.BoardDAO;
import kr.co.dao.ReplyDAO;
import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Inject
	private ReplyDAO rdao;

	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	@Override
	public void insert(BoardVO vo) {
		dao.insert(vo);
		String[] arr =vo.getFiles();
		if(arr==null) {
			return;
		}
		for(int i=0;i<arr.length;i++) {
		dao.addAttach(arr[i], vo.getBno());
		}
	}

	@Override
	public BoardVO read(int bno) {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Override
	public BoardVO updateUI(int bno) {
		return dao.updateUI(bno);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
		dao.deleteAllAttach(vo.getBno());
		String[] files=vo.getFiles();
		if(files==null) {
			return;
		}
		for(String fullName:files) {
			dao.addAttach(fullName, vo.getBno());
		}
	}

	@Override
	public void delete(int bno) {
		dao.deleteAllAttach(bno);
		rdao.deleteByBno(bno);
		dao.delete(bno);
		
		

	}

	@Override
	public List<BoardVO> listPage(Criteria cri) {
		return dao.listPage(cri);
	}

	@Override
	public int getAmount() {
		return dao.getAmount();
	}

	@Override
	public List<BoardVO> search(SearchCriteria cri) {
		return dao.search(cri);
	}

	@Override
	public int getSearchtAmount(SearchCriteria cri) {
		return dao.getSearchAmount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return dao.getAttach(bno);
	}

	@Override
	public void deleteAttach(String fileName, int bno) {
		dao.deleteAttach(fileName,bno);
		
	}

}
