package com.andamiro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.andamiro.domain.recipe.RecipeDTO;

@Mapper
public interface RecipeMapper {

	void regist(RecipeDTO recipeDTO);

	List<RecipeDTO> getReipceList();

	RecipeDTO selectOneRecipeByRecipeId(int recipeId);

}
