package itachi.uchiha.service;

import java.util.List;

import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;

public interface BoardService {

	List<String> getAttach(String productNumber);
	
	List<RegistrationDTO> search(SearchCriteria cri);
	
	int getSearchtAmount(SearchCriteria cri);
	
	void registration(RegistrationDTO dto2);

	MemberDTO wtriteui(String id);

}
