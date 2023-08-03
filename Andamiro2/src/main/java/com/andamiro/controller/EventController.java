package com.andamiro.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.event.EventVO;
import com.andamiro.service.event.EventService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/")
@AllArgsConstructor
public class EventController {
	
	private EventService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list",service.getList());
	}
	
    @PostMapping("/event_write")
	public String register(EventVO event, RedirectAttributes rttr) {
    	
    	log.info("event_write"+event);
    	
    	service.register(event);
    	
    	rttr.addFlashAttribute("result",event.getEventno());
    	
    	return "redirect:/event_write/list";
    }
    @PostMapping("/modify")
    public String modify(EventVO event,RedirectAttributes rttr) {
    	log.info("modify:"+event);
    	
    	if(service.modify(event)) {
    		rttr.addFlashAttribute("result","success");
    		
    	}
    	return "redirect:/event/list";
    }
    @GetMapping("/get")
    public void get(@RequestParam("eventno") int eventno,Model model) {
    	log.info("/get");
    	model.addAttribute("event",service.get(eventno));
    }
   


    @GetMapping("/Event_main")
    public String eventMain(Model model) {
        List<EventVO> eventList = service.getList();
        model.addAttribute("list", eventList);
        return "event/Event_main"; // redirect: 접두사 제거
    }

    @GetMapping("/Event_contest")
    public String eventContest(Model model) {
        List<EventVO> eventList = service.getList();
        model.addAttribute("list", eventList);
        return "event/Event_contest"; // redirect: 접두사 제거
    }

    @GetMapping("/Event_nomal")
    public String eventNormal(Model model) {
        List<EventVO> eventList = service.getList();
        model.addAttribute("list", eventList);
        return "event/Event_nomal"; // redirect: 접두사 제거
    }

}

