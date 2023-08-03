package com.andamiro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.andamiro.domain.recipe.RecipeReviewVO;

@Mapper
public interface RecipeReviewMapper {

	public int insertReview(RecipeReviewVO recipeReviewVO);
	
	public List<RecipeReviewVO> getReviewList(int recipeId);
	
	public int deleteReview(int recipeId);
	
	public int updateReview(RecipeReviewVO recipeReviewVO);
}
