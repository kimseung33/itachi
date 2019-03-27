package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;
import kr.co.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void loginGet() {
		
	}
	
	@RequestMapping(value="/loginPost",method=RequestMethod.POST)
	public void loginPost(LoginDTO dto,Model model)throws Exception {
		UserVO vo= service.login(dto);
		if(vo==null) {
			return;
		}
		model.addAttribute("vo", vo);
		
	}

}
