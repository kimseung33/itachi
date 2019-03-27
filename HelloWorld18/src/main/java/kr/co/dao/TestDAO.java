package kr.co.dao;


import java.util.List;

import kr.co.domain.TestDTO;

public interface TestDAO {
	
	List<TestDTO> list();

	void insert(TestDTO dto);

	TestDTO selectByNum(int num);

	void delete(int num);

	void update(TestDTO dto);
}
