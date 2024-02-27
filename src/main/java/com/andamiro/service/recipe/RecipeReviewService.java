package com.andamiro.service.recipe;

import java.util.List;

import com.andamiro.domain.recipe.RecipeReviewVO;

public interface RecipeReviewService {
	public int register(RecipeReviewVO reviewVO);
	public RecipeReviewVO getReivew(int reviewNum);
	public List<RecipeReviewVO> reviewList (int recipeId);
	public int modify(RecipeReviewVO recipeReviewVO);
	public int remove(int reviewNum);
}
