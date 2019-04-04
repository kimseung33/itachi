package itachi.uchiha.dao;

import java.util.List;


import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;

public interface BoardDAO {
	
	List<RegistrationDTO> search(SearchCriteria cri);
	
	int getSearchAmount(SearchCriteria cri);
	
	void registration(RegistrationDTO dto2);


}
