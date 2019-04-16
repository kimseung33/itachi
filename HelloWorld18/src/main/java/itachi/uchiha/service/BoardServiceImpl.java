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
		String[] arr = dto2.getFiles();
		if (arr == null) {
			return;
		}
		for (int i = 0; i < arr.length; i++) {
			dao.addAttach(arr[i], dto2.getProductNumber());
		}
	}

	@Override
	public void insertin(SellDTO dto) {
		RegistrationDTO rdto = dao.view(dto.getSellNumber());
		if (dto.getNowMoney() < rdto.getDirectMoney()) {
			dao.insertin(dto);
		}
		if (dto.getNowMoney() > rdto.getNowMoney()) {
			dao.umoney(rdto);
		}
		int usellCount = dao.sellCount(dto.getSellNumber());
		dao.usellCount(usellCount, dto.getSellNumber());

	}

	@Override
	public MemberDTO readId(String id) {

		return dao.readId(id);
	}

		@Override
	public List<RegistrationDTO> mainView() {
		List<RegistrationDTO> list = dao.mainView();

		for (RegistrationDTO dto : list) {
			List<String> fileList = dao.getAttach(dto.getProductNumber());
			String[] files = fileList.toArray(new String[fileList.size()]);
			//System.out.println(files[0]);
			dto.setFiles(files);
		}

		return list;
	}

	@Override
	public RegistrationDTO view(String productNumber) {
		return dao.view(productNumber);
	}

	@Override
	public int sellCount(String productNumber) {
		return dao.sellCount(productNumber);
	}

	@Override
	public List<SellDTO> auctionHistory(String productNumber) {
		return dao.auctionHistory(productNumber);
	}
	
	@Override
	public void umoney(RegistrationDTO rdto) {
		dao.umoney(rdto);

	}

}
