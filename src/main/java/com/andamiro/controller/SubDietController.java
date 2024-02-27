package com.andamiro.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.service.subscribe.LowDietService;
import com.andamiro.service.subscribe.ProDietService;
import com.andamiro.service.subscribe.RecDietService;
import com.andamiro.service.subscribe.SimDietService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/diet/*")
@AllArgsConstructor  
public class SubDietController {
	
	private RecDietService recService;
	private SimDietService simService;	
	private LowDietService lowService;	
	private ProDietService proService;	
	
	@GetMapping("/recDiet")
	public void recList(Model model) {
		log.info("recDiet");
	
		List<DietVO> diets = recService.recDiet();
	    List<dietDetailVO> names1 = recService.recName1();
	    List<dietDetailVO> names2 = recService.recName2();
	    List<dietDetailVO> names3 = recService.recName3();
	    List<dietDetailVO> details = recService.recDetail();
	    
	    model.addAttribute("diets", diets);
	    model.addAttribute("names1", names1);
	    model.addAttribute("names2", names2);
	    model.addAttribute("names3", names3);
	    model.addAttribute("details", details);

	}
	

	@GetMapping("/simDiet")
	public void simList(Model model) {
		log.info("simDiet");
	
		List<DietVO> diets = simService.simDiet();
	    List<dietDetailVO> names1 = simService.simName1();
	    List<dietDetailVO> names2 = simService.simName2();
	    List<dietDetailVO> names3 = simService.simName3();
	    List<dietDetailVO> details = simService.simDetail();
	    
	    model.addAttribute("diets", diets);
	    model.addAttribute("names1", names1);
	    model.addAttribute("names2", names2);
	    model.addAttribute("names3", names3);
	    model.addAttribute("details", details);

	}
		
	@GetMapping("/lowDiet")
	public void lowList(Model model) {
		log.info("simDiet");
	
		List<DietVO> diets = lowService.lowDiet();
	    List<dietDetailVO> names1 = lowService.lowName1();
	    List<dietDetailVO> names2 = lowService.lowName2();
	    List<dietDetailVO> names3 = lowService.lowName3();
	    List<dietDetailVO> details = lowService.lowDetail();
	    
	    model.addAttribute("diets", diets);
	    model.addAttribute("names1", names1);
	    model.addAttribute("names2", names2);
	    model.addAttribute("names3", names3);
	    model.addAttribute("details", details);

	}
	
	@GetMapping("/proDiet")
	public void proList(Model model) {
		log.info("proDiet");
	
		List<DietVO> diets = proService.proDiet();
	    List<dietDetailVO> names1 = proService.proName1();
	    List<dietDetailVO> names2 = proService.proName2();
	    List<dietDetailVO> names3 = proService.proName3();
	    List<dietDetailVO> details = proService.proDetail();
	    
	    model.addAttribute("diets", diets);
	    model.addAttribute("names1", names1);
	    model.addAttribute("names2", names2);
	    model.addAttribute("names3", names3);
	    model.addAttribute("details", details);

	}
}
