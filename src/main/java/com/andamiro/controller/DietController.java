package com.andamiro.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.service.diet.DietService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/diet/*")
@AllArgsConstructor
public class DietController {
	private DietService service;

	private static final String UPLOAD_FOLDER = "C:\\upload\\tmp";

	//화면에서 입력을 받아야 하므로 GET방식으로 입력 페이지를 볼 수 있도록 
	@GetMapping("/dietWrite")
	public void register() {
		
	}
	

	//전체 목록 가져옴
	@GetMapping("/dietList")
	public void list(Model model) {
		log.info("dietList");
		model.addAttribute("dietList", service.getList());
	}
	

	//식단 등록 

	@PostMapping("/dietWrite")
    public String register(@RequestParam("diet_kind") String dietKind,
                           @RequestParam("diet_menu") String dietMenu,
                           @RequestParam("diet_picture") MultipartFile dietPicture,
                                 HttpServletRequest request) throws IOException {

        String originalFilename = dietPicture.getOriginalFilename();
        String filePath = UPLOAD_FOLDER + File.separator +originalFilename;
        File destFile = new File(filePath);
        dietPicture.transferTo(destFile);

        DietVO dietVo = new DietVO();
        dietVo.setDiet_kind(dietKind);
        dietVo.setDiet_menu(dietMenu);
        dietVo.setDiet_picture(originalFilename);

        service.register(dietVo);

        return "redirect:/admin/diet/dietList"; 
    }
	
	
	//식단  조회, 수정이 가능한 화면 조회
	@GetMapping({"/dietView","/dietUpdate"})
	public void get(@RequestParam("dietNumber") int dietNumber ,Model model) {
		log.info("/dietView or dietUpdate");
		model.addAttribute("diet", service.get(dietNumber));
		
	}
	
	//식단 수정
	@PostMapping("/dietUpdate")
	public String modify(DietVO dietVo, RedirectAttributes rttr) {
		log.info("modify:"+dietVo);
		
		if(service.modify(dietVo)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/admin/diet/dietList";
	}
	
	//식단 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("dietNumber") int dietNumber, RedirectAttributes rttr) {
		log.info("remove:"+dietNumber);
		
		if(service.remove(dietNumber)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/admin/diet/dietList";
	}      
	
}
