package itachi.uchiha.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;

import itachi.uchiha.service.MemberService;

@Controller
@RequestMapping("/itachi/member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value="/loginpost",method=RequestMethod.POST)
	public void loginPost(LoginDTO dto,Model model)throws Exception{
		MemberDTO memberDTO=service.login(dto);
		if(memberDTO==null) {
			return;
		}
		model.addAttribute("memberDTO", memberDTO);
		System.out.println("MemberControl test입니다.");
	 } 

	public void dkak() {
		
	}



}
