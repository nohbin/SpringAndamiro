package com.andamiro.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.domain.subscribe.SubscribeVO;
import com.andamiro.security.CustomUserDetailService;
import com.andamiro.security.domain.CustomUserDetails;
import com.andamiro.service.subscribe.SubscribeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/subscribe/*")
@AllArgsConstructor 
public class SubscribeController {
	
	private SubscribeService service;
	
	private UserDetailsService userDetilasService;
	
    @GetMapping("/subscribe")
    public void subscribe() {
        
    }
	    
    @GetMapping("/subBtn")
    public void subBtn() {
        
    }
    
    @GetMapping("/pay")
    public void pay() {
        
    }
    

    @PostMapping("/pay")
    public String register(HttpServletRequest request, RedirectAttributes rttr, @RequestParam("username") String username) {
    	System.out.println(username);
    	CustomUserDetails user = (CustomUserDetails)userDetilasService.loadUserByUsername(username);
    	int status = 1;
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	Date currentTime = new Date();
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(currentTime);
    	calendar.add(Calendar.DAY_OF_MONTH, 30);
    	Date endDate = calendar.getTime();
    	String sub_start = dateFormat.format(currentTime);
    	String sub_end = dateFormat.format(endDate);
    	
    	SubscribeVO subscribeVo = new SubscribeVO();
    	subscribeVo.setMemberNumber(user.getMemberNumber());
    	subscribeVo.setSub_start(sub_start);
    	subscribeVo.setSub_end(sub_end);
    	subscribeVo.setStatus(status);
    	
    	System.out.println("등록 전 " + subscribeVo);
    	System.out.println("loginUser: " + user);
    	
    	service.register(subscribeVo);
    	System.out.println("등록 후 "+ subscribeVo);
    	rttr.addFlashAttribute("result",subscribeVo.getSubNumber());
    	return "redirect: /main";
    }
   
    
}
