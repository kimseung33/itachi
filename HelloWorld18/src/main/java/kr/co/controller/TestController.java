package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.TestDTO;
import kr.co.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Inject
	private TestService service;

	@RequestMapping("/list")
	public String list(Model model) {

		List<TestDTO> list = service.list();
		model.addAttribute("list", list);

		System.out.println("-----------------------");
		for (TestDTO x : list) {
			System.out.println(x);
		}
		System.out.println("-----------------------");

		return "test/list";
	}

	@RequestMapping("/insertui")
	public String insertui() {

		return "test/insert";
	}

	@RequestMapping("/insert")
	public String insert(TestDTO dto) {

		service.insert(dto);

		return "redirect:/test/list";
	}
	
	
	@RequestMapping("/selectByNum")
	public String selectByNum(Model model, int num) {
		TestDTO dto = service.selectByNum(num);
		model.addAttribute("dto", dto);
		
		return "test/selectByNum";
		
	}
	
	@RequestMapping("/delete")
	public String delete(int num) {
		service.delete(num);
		
		return "redirect:/test/list";
	}
 
	
	@RequestMapping("/updateui")
	public String updateui(int num, Model model) {
		
		TestDTO dto = service.selectByNum(num);
		model.addAttribute("dto",dto);
		
		return "test/update";
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(TestDTO dto) {
		service.update(dto);
		
		return "redirect:/test/list";
	}
	
}
