package itachi.uchiha.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import itachi.uchiha.domain.MemberDTO;

import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.domain.SearchCriteria;
import itachi.uchiha.domain.SellDTO;
import itachi.uchiha.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService service;
	
	@RequestMapping("/auctionHistory")
	public String auctionHistory(String productNumber, Model model) {
		//입찰자 list
		List<SellDTO> list =  service.auctionHistory(productNumber);
		model.addAttribute("list", list);
		
		//경매 물품info
		RegistrationDTO dto = service.view(productNumber);
		model.addAttribute("view", dto);
		
		return "itachi/auctionHistory";
	}

	@RequestMapping("/bookorticket")
	public String bookorticket(String productNumber,Model model) {
		List<RegistrationDTO> category=service.category(productNumber);
		
		model.addAttribute("ctgrview", category);
		
		
		return "/itachi/bookorticket";
	}
	
	@RequestMapping("/appliances")
	public String appliances(String productNumber,Model model) {
		List<RegistrationDTO> category=service.category(productNumber);
		
		model.addAttribute("ctgrview", category);
		
		
		return "/itachi/appliances";
	}
	
	@RequestMapping("/merchandise")
	public String merchandise(String productNumber,Model model) {
		List<RegistrationDTO> category=service.category(productNumber);
		
		model.addAttribute("ctgrview", category);
		
		
		return "/itachi/merchandise";
	}
	
	@RequestMapping("/beauty")
	public String beauty(String productNumber ,Model model) {
		List<RegistrationDTO> category=service.category(productNumber);
		
		model.addAttribute("ctgrview", category);
		
		
		return "/itachi/beauty";
	}
	
	@RequestMapping("/clothing")
	public String clothing(String productNumber ,Model model) {
		List<RegistrationDTO> category=service.category(productNumber);
		
		model.addAttribute("ctgrview", category);
		
		
		return "/itachi/clothing";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		// 맵퍼에  sellid (입찰자) 조인 해오면 dto에 sellid(입찰자)가 들어가나요??
		List<RegistrationDTO> dto = service.mainView();	
		
		model.addAttribute("view", dto);
		//dto에 view.sellid가 안되지않을까
		//RegistrationDTO sellid를 추가하면 조인에서 가져온 sellid를 get메서드로 사용해서 쓸수있나??
		
		return "/itachi/main";
	}

	@RequestMapping(value = "/search")
	public String search(SearchCriteria cri, Model model) {
		List<RegistrationDTO> list = service.search(cri);
		
		model.addAttribute("list", list);

		int amount = service.getSearchtAmount(cri);

		
		return "/itachi/search";
	}

	@RequestMapping("/Registration")
	public String Registration(Model model, String id) {
		System.out.println(id);

		MemberDTO dto = service.readId(id);
		model.addAttribute("write", dto);

		return "/itachi/Registration";
	}


	@RequestMapping(value="/registrationC", method=RequestMethod.POST)
	public String registration(RegistrationDTO dto2) {
		service.registration(dto2);
		return "redirect:/board/main";
	}

	@RequestMapping("/sellin")
	public String sellIn(String productNumber, Model model) {
		//경매물품에 대한 정보
		RegistrationDTO dto = service.view(productNumber);
		model.addAttribute("list", dto);
		
		return "/sell/sellin";
	}

	@RequestMapping(value = "/sellin", method = RequestMethod.POST)
	public String sellIn(SellDTO dto,Model model) {
		service.insertin(dto);
		model.addAttribute("productNumber", dto.getSellNumber());
		return "redirect:/board/view";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view_page(String productNumber, Model model) {
		
		//경매물품에 대한 정보
		RegistrationDTO dto = service.view(productNumber);
		model.addAttribute("view", dto);
		
		//입찰 수 구하기
		int sellcount = service.sellCount(productNumber);
				
		model.addAttribute("sellCount", sellcount);
		
		return "/itachi/view";
	}
	
	@ResponseBody
	@RequestMapping(value="/getAttach/{productNumber}", method=RequestMethod.GET)
	public List<String> getAttach(@PathVariable("productNumber") String productNumber){
		return service.getAttach(productNumber);
	}

}
