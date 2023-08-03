package com.andamiro.service.recipe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.recipe.RecipeDTO;
import com.andamiro.domain.recipe.RecipeIngreVO;
import com.andamiro.domain.recipe.RecipeOrderVO;
import com.andamiro.domain.recipe.RecipePicVO;
import com.andamiro.mapper.RecipeMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class RecipeServiceImpl implements RecipeService {
	
	private final RecipeMapper recipeMapper;

	@Override
	public void registRecipe(RecipeDTO recipeDTO) {
		// TODO Auto-generated method stub
		recipeMapper.regist(recipeDTO);
	}

	@Override
	public List<RecipeDTO> getRecipeList() {
		// TODO Auto-generated method stub
		return recipeMapper.getReipceList();
	}

	@Override
	public RecipeDTO selectOneRecipeByRecipeId(int recipeId) {
		// TODO Auto-generated method stub
		
		
		return recipeMapper.selectOneRecipeByRecipeId(recipeId);
	}

	
	
	
}
