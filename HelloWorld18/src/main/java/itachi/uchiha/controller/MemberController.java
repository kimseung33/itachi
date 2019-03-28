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
	
	@RequestMapping(value="/loginpost",method=RequestMethod.POST)
	public void loginPost(LoginDTO dto,Model model)throws Exception{
		MemberDTO memberDTO=service.login(dto);
		if(memberDTO==null) {
			return;
		}
		model.addAttribute("memberDTO", memberDTO);
		System.out.println("MemberControl test입니다.");
		System.out.println("MemberControl test입니다.");
		System.out.println("MemberControl test입니다.");System.out.println("MemberControl test입니다.");
	 }	
	
	@RequestMapping(value="/loginpost",method=RequestMethod.GET)
	public void loginPost() {
		
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void loginGet() {
		
	}	
	
	
	@RequestMapping(value = "/findingId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody String findingId(@ModelAttribute MemberDTO dto, Model model , HttpServletResponse response)throws Exception {

		System.out.println(dto.toString());


		ArrayList <String> emailList = service.findId(dto);
		System.out.println(emailList.toString());
		System.out.println(emailList.get(0));
		String findEmail = "{\"user_email\":\""+emailList+"\"}";

		System.out.println(findEmail);

		return findEmail;
	}



}
