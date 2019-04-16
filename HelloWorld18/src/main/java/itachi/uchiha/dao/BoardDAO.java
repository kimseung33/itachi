package itachi.uchiha.dao;

import java.util.List;

import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import itachi.uchiha.domain.SellDTO;

public interface BoardDAO {
	
	List<RegistrationDTO> search(SearchCriteria cri);
	
	int getSearchAmount(SearchCriteria cri);
	
	void registration(RegistrationDTO dto2);


	void insertin(SellDTO dto);

	MemberDTO readId(String id);
	
	void addAttach(String fullName,String productNumber);
	
	List<String> getAttach(String productNumber);
	
	List<RegistrationDTO> mainView();

	RegistrationDTO view(String productNumber);

	List<RegistrationDTO> category(String productNumber);

	int sellCount(String productNumber);
	
	List<SellDTO> auctionHistory(String productNumber);
		
	void umoney(RegistrationDTO rdto);
	
	void usellCount(int usellCount,String productNumber); 
	
	RegistrationDTO Rupdateui(String id,String productNumber);

	void Rupdate(RegistrationDTO dto);
	
	List<RegistrationDTO> mylist(String id); 
}
