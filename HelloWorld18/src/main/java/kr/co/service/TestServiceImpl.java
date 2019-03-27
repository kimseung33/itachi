package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.TestDAO;
import kr.co.domain.TestDTO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO dao;

	@Override
	public List<TestDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void insert(TestDTO dto) {
		dao.insert(dto);

	}

	@Override
	public TestDTO selectByNum(int num) {
		return dao.selectByNum(num);
	}

	@Override
	public void delete(int num) {
		dao.delete(num);
	}

	@Override
	public void update(TestDTO dto) {
dao.update(dto);
	}

}
