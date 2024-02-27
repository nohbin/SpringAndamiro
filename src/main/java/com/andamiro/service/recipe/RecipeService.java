package com.andamiro.service.recipe;

import java.util.List;

import com.andamiro.domain.recipe.RecipeDTO;

public interface RecipeService {
	
	void registRecipe(RecipeDTO recipeDTO);
	
	List<RecipeDTO> getRecipeList();

	RecipeDTO selectOneRecipeByRecipeId(int recipeId);
}
