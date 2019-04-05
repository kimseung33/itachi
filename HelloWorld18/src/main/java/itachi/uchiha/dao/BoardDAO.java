package itachi.uchiha.dao;

import java.util.List;


import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import itachi.uchiha.domain.SellDTO;

public interface BoardDAO {
	
	List<RegistrationDTO> search(SearchCriteria cri);
	
	int getSearchAmount(SearchCriteria cri);
	
	void registration(RegistrationDTO dto2);

	void insertin(SellDTO dto);
}
