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
		List<RegistrationDTO> dto = service.mainView();
		System.out.println(dto);
		model.addAttribute("view", dto);
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

		MemberDTO dto = service.wtriteui(id);
		model.addAttribute("write", dto);

		return "/itachi/Registration";
	}


	@RequestMapping(value="/registrationC", method=RequestMethod.POST)
	public String registration(RegistrationDTO dto2) {
		service.registration(dto2);
		return "itachi/main";
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
		RegistrationDTO rdto =new RegistrationDTO();
		System.out.println(rdto);
		model.addAttribute("list",rdto);
		return "/";
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
