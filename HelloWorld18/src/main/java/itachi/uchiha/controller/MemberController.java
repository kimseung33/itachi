package itachi.uchiha.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "itachi/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public String idCheck(@RequestBody MemberDTO dto, Model model) {
		String idck = service.idCheck(dto.getMb_Id());
		return idck;
	}
	
	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public String loginPost(LoginDTO dto, Model model) throws Exception {
		MemberDTO memberDTO = service.login(dto);
		if (memberDTO == null) {
			return null;
		}
		
		model.addAttribute("memberDTO", dto);

		return "/itachi/main";



	}

	@RequestMapping(value = "/loginpost", method = RequestMethod.GET)
	public void loginPost() {
		
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {
		
	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public String findIde(String name,String email,String birth, int hp, String find_check, Model model){
		
	
		model.addAttribute("mb_Name",name);
		
	
		if(find_check.equals("email")) {
			model.addAttribute("mb_Email",email);
			service.findIde(name, email);
	
		} else if(find_check.equals("hp")) {
			model.addAttribute("mb_Birth",birth);
			model.addAttribute("mb_Hp",hp);
			service.findIdh(name, birth, hp);
		}
		
		
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

		return "/member/login";
	}
	@RequestMapping("insert")
	public String insertUI() {
		
		return "/member/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(MemberDTO dto) {
		service.insert(dto);
		return "redirect:/member/login";
	} 
	


}
