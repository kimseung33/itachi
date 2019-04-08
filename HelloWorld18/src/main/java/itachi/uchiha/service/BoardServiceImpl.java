package itachi.uchiha.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itachi.uchiha.dao.BoardDAO;
import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<String> getAttach(String productNumber) {
		return dao.getAttach(productNumber);
	}
	
	
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
		String[] arr =dto2.getFiles();
		if(arr==null) {
			return;
		}
		for(int i=0;i<arr.length;i++) {
		dao.addAttach(arr[i], dto2.getProductNumber());
		}
	}

	@Override
	public MemberDTO wtriteui(String id) {
		// TODO Auto-generated method stub
		return dao.writeui(id);
	}
	
	

}
