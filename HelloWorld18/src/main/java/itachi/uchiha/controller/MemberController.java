package itachi.uchiha.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itachi.uchiha.domain.LoginDTO;
import itachi.uchiha.domain.MemberDTO;
import itachi.uchiha.domain.RegistrationDTO;
import itachi.uchiha.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "cash", method=RequestMethod.POST)
	public String cash(MemberDTO dto) {
		
		service.cash(dto);
		System.out.println(dto.getMb_cash()+"컨트롤러 돈나와");

		return "/itachi/main";
	}

	@RequestMapping("cashui")
	public String cashui(Model model, String id) {
		MemberDTO readid = service.readid(id);
		model.addAttribute("readid", readid);
		return "/member/cash";
	}

	@RequestMapping(value = "/find_idUI")
	public String find_idUI() {
		return "/member/find_idUI";
	}

	@RequestMapping(value = "/selectpw", method = RequestMethod.POST)
	public String selectpw(Model model, MemberDTO dto) throws Exception {

		service.selectpw(dto);

		return "member/login";
	}

	@RequestMapping(value = "/selectpw", method = RequestMethod.GET)
	public String selectpw() {
		return "/member/selectpw";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "itachi/main";
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestBody MemberDTO dto, Model model) {
		String idck = service.idCheck(dto.getMb_Id());
		return idck;
	}

	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public String emailCheck(@RequestBody MemberDTO dto) {
		String emailck = service.emailCheck(dto.getMb_Email());

		return emailck;
	}

	// 왜안되에에에에에에ㅔ
	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public String loginPost(LoginDTO dto, Model model) throws Exception {

		MemberDTO memberDTO = service.login(dto);
		if (memberDTO == null) {
			System.out.println("비밀번호틀림");
			return "member/memberalert";
		} else {
		}
		System.out.println(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("login", dto);
		return "/itachi/main";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {

	}

	@RequestMapping(value = "/findid_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("mb_Email") String mb_Email,
			@RequestParam("mb_Name") String mb_Name, Model md) throws Exception {
		md.addAttribute("id", service.findId(mb_Email, mb_Name, response));
		return "/member/findid_id";
	}

	@RequestMapping(value = "/findid")
	public String find_id_form() throws Exception {
		return "/member/findid";
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

		return "/itachi/main";
	}

	@RequestMapping("insert")
	public String insertUI() {

		return "/member/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		System.out.println(dto);
		service.insert(dto);
		return "redirect:/member/login";
	}

}
