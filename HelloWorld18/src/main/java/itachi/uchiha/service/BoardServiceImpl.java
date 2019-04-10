package itachi.uchiha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itachi.uchiha.dao.BoardDAO;
import itachi.uchiha.dao.MemberDAO;
import itachi.uchiha.domain.MemberDTO;
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
	public List<RegistrationDTO> category(String productNumber) {
		List<RegistrationDTO> list = dao.category(productNumber);
		
		for (RegistrationDTO dto : list) {
		List<String> fileList = dao.getAttach(dto.getProductNumber());
		String[] files = fileList.toArray(new String[fileList.size()]);
		dto.setFiles(files);
		}
		
		return list;
	}
	
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
		List<RegistrationDTO> list = dao.search(cri);
		
		for (RegistrationDTO dto : list) {
		List<String> fileList = dao.getAttach(dto.getProductNumber());
		String[] files = fileList.toArray(new String[fileList.size()]);
		dto.setFiles(files);
		}
		
		return list;
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
	public void insertin(SellDTO dto) {
		// TODO Auto-generated method stub
		dao.insertin(dto);

	}		
	
	@Override
	public MemberDTO wtriteui(String id) {
		// TODO Auto-generated method stub
		return dao.writeui(id);
	}

	@Override
	public List<RegistrationDTO> mainView() {
		return dao.mainView();
	}
	
	@Override
	public RegistrationDTO view(String productNumber) {
		return dao.view(productNumber);
	}

	@Override
	public int sellCount(String productNumber) {
		return dao.sellCount(productNumber);
	}
	
}
