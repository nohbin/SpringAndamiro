package com.andamiro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.service.member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private final MemberService memberService;

	@GetMapping(value = "login")
	public void login(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}

	}

	@GetMapping(value = "logout")
	public String logoutPost(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/member/login";
	}

	@GetMapping(value = "signup")
	public void signUpGet() {

	}

	@PostMapping(value = "signup")
	public String signUpPost(@ModelAttribute MemberVO memberVO, RedirectAttributes rttr) {
		memberService.singUp(memberVO);
		log.info(memberVO);
		rttr.addFlashAttribute("result", memberVO.getId());
		return "redirect:/member/login";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheckService(@RequestParam("id") String id) throws Exception {
		int count = memberService.idCheck(id);
		return count;
	}

}