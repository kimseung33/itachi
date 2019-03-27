package kr.co.dao;

import java.util.List;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

public interface BoardDAO {

	List<BoardVO> list();
	void insert(BoardVO vo);
	BoardVO read(int bno);
	BoardVO updateUI(int bno);
	void update(BoardVO vo);
	void delete(int bno);
	List<BoardVO> listPage(Criteria cri);
	int getAmount();
	List<BoardVO> search(SearchCriteria cri);
	int getSearchAmount(SearchCriteria cri);
	void updateViewCnt(int bno);
	void addAttach(String fullName,int bno);
	List<String> getAttach(Integer bno);
	void deleteAttach(String fileName, int bno);
	void deleteAllAttach(int bno);
	
}
