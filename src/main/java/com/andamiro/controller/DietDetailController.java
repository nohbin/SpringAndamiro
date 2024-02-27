package com.andamiro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.service.diet.DietDetailService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/diet/*")
@AllArgsConstructor  
public class DietDetailController {
	
	private DietDetailService service;
	
	//전체 목록 가져옴
	//serviceImpl의 getList()객체의 결과를 담아 전달 (addAttribute)
	@GetMapping("/dietDetailList")
	public void list(Model model) {   //게시물의 목록 전달하므로 Model 파라미터 지정
		log.info("dietDetailList");
		model.addAttribute("dietDetailList",service.getList());   //
		
	}
	
	//화면에서 입력을 받아야 하므로 GET 방식으로 등록 페이지 볼 수 있도록
	@GetMapping("/dietDetailWrite")
	public void register() {
		
	}
	
	//식단 상세 등록
	@PostMapping("/dietDetailWrite")
	public String register(dietDetailVO detail, RedirectAttributes rttr) {
		log.info("register: " + detail);
		service.register(detail);
		rttr.addFlashAttribute("result", detail.getDietDetailID());
		
		return "redirect:/admin/diet/dietDetailList";
		
	}
	
	//조회, 수정이 가능한 화면 조회
	@GetMapping({"/dietDetailView","/dietDetailUpdate"})
	public void get(@RequestParam("dietDetailID") int dietDetailID, Model model) {
		log.info("/dietDetailView or dietDetailUpdate");
		model.addAttribute("dietDetail", service.get(dietDetailID));   //dietDetail이라는 이름으로 service.get(dietDetailID)의 결과를 Model에 추가 .
																	   //jsp 파일에서 forEach 변수 이름과 동일해야함.
		
	}
	
	//수정
	//service.modify: 수정 여부 boolean으로 처리. 성공한 경우에만 rttr에 추가 
	@PostMapping("/dietDetailUpdate")
	public String modify(dietDetailVO dietDetail, RedirectAttributes rttr) {
		log.info("modify: "+ dietDetail);
	    
		if(service.modify(dietDetail)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		return "redirect:/admin/diet/dietDetailList";
	}
	
	//삭제 
	@PostMapping("/detailRemove")
	public String remove(@RequestParam("dietDetailID") int dietDetailID, RedirectAttributes rttr) {
		log.info("remove: " + dietDetailID);
		
		if(service.remove(dietDetailID)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/diet/dietDetailList"; 
	}
}












