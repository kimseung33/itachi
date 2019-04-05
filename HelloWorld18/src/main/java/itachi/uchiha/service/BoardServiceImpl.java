package itachi.uchiha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itachi.uchiha.dao.BoardDAO;
import itachi.uchiha.dao.MemberDAO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import itachi.uchiha.domain.SellDTO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Inject
	private MemberDAO mdao;

	@Override
	public int getSearchtAmount(SearchCriteria cri) {
		return dao.getSearchAmount(cri);
	}
	
	@Override
	public List<RegistrationDTO> search(SearchCriteria cri) {
		return dao.search(cri);
	}
	
	@Override
	public void registration(RegistrationDTO dto2) {
		dao.registration(dto2);
	}

	@Override
	public void insertin(SellDTO dto) {
		// TODO Auto-generated method stub
		dao.insertin(dto);
		
	}
	
	

}
