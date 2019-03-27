package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping("/select")
	public String select(Model model) {

		List<MemberDTO> list = service.select();
		model.addAttribute("list", list);

		return "member/select";
	}

	@RequestMapping("/insertui")
	public String insertui() {
		return "member/insert";

	}
	
 
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(MemberDTO dto) {
		service.insert(dto);
		return "redirect:/member/select";

	}
	@RequestMapping(value="/selectbyid")
	public void selectById(int id, Model model) {
		MemberDTO dto = service.selectById(id);
		model.addAttribute("dto", dto);
	}

	@RequestMapping(value="/updateui")
public String updateui(int id, Model model) {
		
		MemberDTO dto = service.updateui(id);
	    model.addAttribute("dto",dto);
	
		return "member/update";
	}	
	
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(MemberDTO dto) {
		
		service.update(dto);
		
		return "redirect:/member/select";
	}
	
	
	@RequestMapping(value="delete")
	public String delete(int num) {
		
		service.delete(num);
		
		return "redirect:/member/select";
	}
	

	
}
