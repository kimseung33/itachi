package itachi.uchiha.service;

import java.util.List;

import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import itachi.uchiha.domain.SellDTO;

public interface BoardService {

	List<String> getAttach(String productNumber);
	
	void insertin(SellDTO dto);
	
	List<RegistrationDTO> search(SearchCriteria cri);
	
	int getSearchtAmount(SearchCriteria cri);
	
	void registration(RegistrationDTO dto2);

	MemberDTO wtriteui(String id);
	
	List<RegistrationDTO> mainView();
	
	RegistrationDTO view(String productNumber);

	List<RegistrationDTO> category(String productNumber);
	
	int sellCount(String productNumber);

}
