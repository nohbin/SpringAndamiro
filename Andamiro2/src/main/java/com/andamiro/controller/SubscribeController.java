package com.andamiro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.subscribe.SubscribeVO;
import com.andamiro.service.subscribe.SubscribeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/subscribe/*")
@AllArgsConstructor 
public class SubscribeController {
	
	private SubscribeService service;
	
    @GetMapping("/subscribe")
    public void subscribe() {
        
    }
	    
    @GetMapping("/subBtn")
    public void subBtn() {
        
    }
    
    @GetMapping("/pay")
    public void pay() {
        
    }
    
//    @PostMapping("/pay")
//    public String register(SubscribeVO subscribe, RedirectAttributes rttr) {
//    	s
//    	
//    	
//    	log.info("register: " + subscribe);
//    	service.register(subscribe);
//    	rttr.addFlashAttribute("result",subscribe.getSubNumber());
//    	return "redirect: /subscribe/subscribe";   
//    }
    
}
