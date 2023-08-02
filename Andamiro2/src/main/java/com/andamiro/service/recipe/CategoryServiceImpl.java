package com.andamiro.service.recipe;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.andamiro.mapper.CategoryMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

	private final CategoryMapper categoryMapper;
	
	public Map<String, Object> getCategoryData() {
        Map<String, Object> categoryData = new HashMap<>();

        categoryData.put("howList", categoryMapper.getRecipeHowList());
        categoryData.put("mainIngreList", categoryMapper.getRecipeMainIngreList());
        categoryData.put("kindList", categoryMapper.getRecipeKindList());

        return categoryData;
    }
}
