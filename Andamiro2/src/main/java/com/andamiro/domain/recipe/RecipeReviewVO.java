package com.andamiro.domain.recipe;

import java.security.Timestamp;

import lombok.Data;

@Data
public class RecipeReviewVO {
	
	
	private int reviewNum;
	private int recipeId;
	private int userNumber;
	private String reviewPicture;
	private String review;
	private int recipeGrade;
	private Timestamp regdate;
	
	
}
