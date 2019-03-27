package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.Criteria;
import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;
	private final String NS = "kr.co.mapper.reply";

	@Override
	public void insert(ReplyVO vo) {
		int rno = createRno();

		vo.setRno(rno);

		session.insert(NS + ".insert", vo);

	}

	private int createRno() {
		Integer rno = session.selectOne(NS + ".createRno");

		if (rno == null) {
			rno = 1;

		} else {
			++rno;
		}
		return rno;
	}

	@Override
	public List<ReplyVO> list(int bno) {
        
		return session.selectList(NS+".list", bno);
	}

	@Override
	public void update(ReplyVO vo) {

		session.update(NS+".update",vo);
	}

	@Override
	public void delete(int rno) {

		session.delete(NS+".delete",rno);
	}

	@Override
	public int getAmount(Integer bno) {
		Integer amount=session.selectOne(NS+".getAmount", bno);
		if(amount==null) {
			return 0;
		}
		return amount;
	}

	@Override
	public List<ReplyVO> list(int bno, int page) {
		Criteria cri = new Criteria(page, 10);
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return session.selectList(NS+".list", bno,rb);
	}

	@Override
	public void deleteByBno(int bno) {
		session.delete(NS+".deleteByBno", bno);
		
	}

	

}
