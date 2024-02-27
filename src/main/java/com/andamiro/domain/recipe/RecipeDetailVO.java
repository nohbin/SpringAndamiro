package com.andamiro.domain.recipe;

import lombok.Data;

@Data
public class RecipeDetailVO {
	
	private int recipeDetailID;
	private int recipeId;
	private int recipeHow; 
	private int recipeKind; 
	private int recipeMainIngre; 
	private RecipePicVO recipePicVO;
	private RecipeOrderVO recipeOrderVO;
	private RecipeIngreVO recipeingreVO;
	private String recipeDiscription; 
	private String recipeforperson;
	private String recipefortime;
	private String recipeforlevel;
	private int recipePicId;
	private int orderId;
	private int recipeIngreId;
	
}
