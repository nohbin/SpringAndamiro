package com.andamiro.controller;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.andamiro.service.recipe.CategoryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/*")
@Log4j
@AllArgsConstructor
public class CategoryController {
	
	
	private CategoryService categoryService;
	
	@RequestMapping(value =  "getCategories")
	public Map<String, Object> getCategories(){
		return categoryService.getCategoryData();
	}
}
