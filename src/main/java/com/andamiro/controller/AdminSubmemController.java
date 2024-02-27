package com.andamiro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.service.subscribe.SubscribeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/subscribe/*")
@AllArgsConstructor 

public class AdminSubmemController {
	
	private SubscribeService service;
	
	
	//구독 회원 목록 
	@GetMapping("/submemList")
	public void list(Model model) {
		log.info("submemList");
		model.addAttribute("submemList",service.getList());
		
	}
	
	
	@GetMapping("/submemView")
	public void get(@RequestParam("subNumber") int subNumber, Model model) {
		log.info("/submemView");
		model.addAttribute("subscribe",service.get(subNumber));
		
	}
	
	
	@PostMapping("/submemRemove")
	public String remove(@RequestParam("subNumber") int subNumber, RedirectAttributes rttr) {
		log.info("remove: " + subNumber );
		
		if(service.remove(subNumber)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/admin/subscribe/submemList";
	}
	
	
	
}
