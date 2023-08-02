package com.andamiro.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andamiro.domain.board.BoardVO;
import com.andamiro.domain.board.Criteria;
import com.andamiro.domain.board.PageDTO;
import com.andamiro.service.board.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		System.out.println("과연~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+cri);
		int total = service.getTotalCount(cri);
		System.out.println("totalCount??" + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	@GetMapping("/register")
	public void register() {}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) { //인풋태그로부터 파라미터 수집.
//		log.info("==================================================");
//		log.info("register : " + board);
//		if(board.getAttachList() != null) {
//			board.getAttachList().forEach(attach -> log.info(attach));
//		}
//		log.info("==================================================");
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}

	@GetMapping({"/modify"})
	public void getModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.read(bno));
	}
	@GetMapping({"/get"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.read(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.modify(board)) {
			String[] strArr = {"success"};
			rttr.addFlashAttribute("result", strArr[0]);
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	
	}
	@ResponseBody
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/recommend/{bno}", consumes="application/json", produces={ MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Long> recommend(@PathVariable("bno") Long bno) {
		int result = service.recommend(bno);
		BoardVO board = service.read(bno);
		Long updatedRecommendCount = board.getRecommendCount();
		return result == 1 ? new ResponseEntity<>(updatedRecommendCount, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
