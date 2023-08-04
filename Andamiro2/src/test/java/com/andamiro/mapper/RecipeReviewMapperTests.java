package com.andamiro.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.recipe.RecipeReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecipeReviewMapperTests {

	@Autowired
	private RecipeReviewMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
		RecipeReviewVO vo = new RecipeReviewVO();
		
		
			vo.setRecipeId(3);
			vo.setRecipeGrade(1);
			vo.setReview("reviewtextgood");
			vo.setReviewPicture("reviewpicture");
			vo.setUserNumber(2);
		
		
		mapper.insertReview(vo);
	}
	
	@Test
	public void deleteReviewTest() {
		int result = mapper.deleteReview(1);
		
		if(result == 1) {
			log.info("delete good");
		}else {
			throw new IllegalArgumentException("에러 발생 삭제 불가");
		}
	}
	
	@Test
	public void updateReviewTest() {
		RecipeReviewVO vo = new RecipeReviewVO();
		int result = mapper.updateReview(vo);
		
	}
}
