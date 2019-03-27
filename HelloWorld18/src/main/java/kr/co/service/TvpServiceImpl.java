package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dao.TvpDAO;
import kr.co.domain.TvpDTO;

@Service
@RequestMapping("/tvp")
public class TvpServiceImpl implements TvpService{

	@Autowired
	public TvpDAO dao;
	
	@Override
	public List<TvpDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

}
