package itachi.uchiha.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping("/main")
	public String main(Model model) {
		List<RegistrationDTO> dto = service.mainView();
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
		System.out.println("글좀쓰자이놈아");
		System.out.println(id);

		MemberDTO dto = service.wtriteui(id);
		model.addAttribute("write", dto);

		return "/itachi/Registration";
	}

	@RequestMapping(value="/registrationC", method=RequestMethod.POST)
	public String registration(RegistrationDTO dto2) {
		System.out.println("RegistrationDTO컨트롤러:::::::::::::::::::::");
		System.out.println("멤버컨트롤러 dtp2 전" + dto2 + ":::::::::::::::::::::::::::::::::::::::");
		service.registration(dto2);

		System.out.println("멤버컨트롤러 dtp2 후" + dto2 + ":::::::::::::::::::::::::::::::::::::::");
		return "itachi/main";
	}

	@RequestMapping("/sellin")
	public String sellIn() {
		return "/sell/sellin";
	}

	@RequestMapping(value = "/sellin", method = RequestMethod.POST)
	public String sellIn(SellDTO dto) {
		service.insertin(dto);
		return "/";
	}

}
