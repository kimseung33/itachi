package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dao.TvpDAO;
import kr.co.domain.TvpDTO;
import kr.co.service.TvpService;

@Controller
@RequestMapping("/tvp")
public class TvpController {

	@Inject
	private TvpService service;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<TvpDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "tvp/list";
	}
}
