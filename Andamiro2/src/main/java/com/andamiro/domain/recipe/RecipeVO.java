package com.andamiro.domain.recipe;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecipeVO {

	private int recipeId;
	private int memberNumber;
	private String userId; 
	private String recipeName; 
	private String recipetag1;
	private String recipetag2;
	private String recipetag3;
	private String recipeGrade;
	
	private int recipeView;
	private int recipeCompetition;
	private int recipeDetailId;
	private Timestamp recipeRegDate;
	private RecipeDetailVO recipeDetailVO;
	private int reviewCount;
	private int eventno;
	
}
