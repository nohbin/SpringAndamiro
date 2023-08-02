package com.andamiro.domain.recipe;

import lombok.Data;

@Data
public class RecipeDTO {
	private int recipeIdKey;
	private RecipeVO recipeVO;
	private RecipeDetailVO recipeDetailVO;
	private RecipeIngreVO recipeIngreVO;
	private RecipeOrderVO recipeOrderVO;
	private RecipePicVO recipePicVO;
}
