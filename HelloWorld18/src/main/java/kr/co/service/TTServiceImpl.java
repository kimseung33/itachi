package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dao.TTDAO;
import kr.co.domain.TTDTO;

@Service
@RequestMapping("/tt")
public class TTServiceImpl implements TTService{
	
	@Autowired // or @Inject
	private TTDAO dao;
	
	@Override
	public void insert(TTDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public List<TTDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	
}
