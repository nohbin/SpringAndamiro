package com.andamiro.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.recipe.RecipeDTO;
import com.andamiro.domain.recipe.RecipePicVO;
import com.andamiro.domain.recipe.RecipeVO;
import com.andamiro.service.recipe.RecipeService;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecipeMapperTests {
	
	@Autowired
	private RecipeService service;
	
	
	@Test
	public void recipeRegistTest() {
		RecipeVO vo = new RecipeVO();
		RecipePicVO picVo = new RecipePicVO();
		RecipeDTO dto = new RecipeDTO();
		picVo.setMainPicture("testMainPicture");
		vo.setRecipeId(1);
		vo.setMemberNumber(1);
		vo.setRecipeName("testName");
		vo.setRecipetag1("tag1");
		vo.setRecipetag2("tag2");
		vo.setRecipetag3("tag3");
		vo.setUserId("testUserID");
		vo.setRecipeDetailId(1);
		dto.setRecipeVO(vo);
		dto.setRecipePicVO(picVo);
		
		service.registRecipe(dto);
	}
}
