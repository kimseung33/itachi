package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	//이건 전에 배웠던 세션이 아님!!!!!
	private final String NS="kr.co.mapper.board";
	//네임스페이스
	
	
	
	@Override
	public List<BoardVO> list() {
		return session.selectList(NS+".list");
	}



	@Override
	public void insert(BoardVO vo) {
         Integer bno = createBno();
		if(bno==null) {
			bno=1;
		}else {bno++;}
		vo.setBno(bno);
		session.insert(NS+".insert", vo);
	}



	private Integer createBno() {
		return session.selectOne(NS+".createBno");
	}



	@Override
	public BoardVO read(int bno) {
		return session.selectOne(NS+".selectByBno",bno);
	}



	@Override
	public BoardVO updateUI(int bno) {
		return session.selectOne(NS+".updateUI", bno);
	}



	@Override
	public void update(BoardVO vo) {

		session.update(NS+".update",vo);
	}



	@Override
	public void delete(int bno) {

		session.delete(NS+".delete", bno);
		}



	@Override
	public List<BoardVO> listPage(Criteria cri) {
		
		RowBounds rb = new RowBounds(cri.getStartNum()-1,cri.getPerPage());
		
		return session.selectList(NS+".list",0, rb);
	}



	@Override
	public int getAmount() {
		
		return session.selectOne(NS+".getAmount");
	}



	@Override
	public List<BoardVO> search(SearchCriteria cri) {
		
		
		RowBounds rb = new RowBounds(cri.getStartNum()-1, cri.getPerPage());

		return session.selectList(NS+".search", cri, rb);
		
	}



	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return session.selectOne(NS+".getSearchAmount",cri);
	}



	@Override
	public void updateViewCnt(int bno) {
		session.update(NS+".updateViewCnt", bno);
		
	}



	@Override
	public void addAttach(String fullName, int bno) {
		int id=getId();
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("fullName",fullName);
		map.put("bno", bno);
		session.insert(NS+".addAttach", map);
		
	}
	private int getId() {
		Integer id= session.selectOne(NS+".getId");
		if(id==null) {
			id=0;
		}
		return ++id;
	}



	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".getAttach",bno);
	}



	@Override
	public void deleteAttach(String fileName, int bno) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("bno", bno);
		session.delete(NS+".deleteAttach", map);
		
	}



	@Override
	public void deleteAllAttach(int bno) {
		session.delete(NS+".deleteAllAttach",bno);
		
	}

}
