package itachi.uchiha.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

import itachi.uchiha.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, Model model) throws Exception {
		MemberDTO memberDTO = service.login(dto);
		if (memberDTO == null) {
			return;
		}
		model.addAttribute("memberDTO", dto);
	}

	@RequestMapping(value = "/loginpost", method = RequestMethod.GET)
	public void loginPost() {
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {

	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String findingId(@ModelAttribute MemberDTO dto, Model model, HttpServletResponse response)
			throws Exception {
		model.addAttribute("id", service.findId(dto));
		return "/member/findid";

	}
	
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public void findid() {

	}
	

	@RequestMapping("/update")
	public String updateUI(Model model, String id) {

		MemberDTO dto = service.updateui(id);
		model.addAttribute("dto", dto);
		return "/member/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(MemberDTO dto) {

		service.update(dto);

		return "sp";
	}
	@RequestMapping("insert")
	public String insertUI() {
		
		return "/member/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(MemberDTO dto) {
		service.insert(dto);
		return "sp";
	}  
}
