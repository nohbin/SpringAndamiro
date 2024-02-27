package com.andamiro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

import com.andamiro.domain.recipe.RecipeHowDTO;
import com.andamiro.domain.recipe.RecipeKindDTO;
import com.andamiro.domain.recipe.RecipeMainIngreDTO;

public interface CategoryMapper {

	List<RecipeKindDTO> getRecipeKindList();
	List<RecipeMainIngreDTO> getRecipeMainIngreList();
	List<RecipeHowDTO> getRecipeHowList();
	
}
