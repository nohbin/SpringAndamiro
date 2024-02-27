package com.andamiro.mapper;

import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.service.recipe.CategoryService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CategoryMapperTest {

	@Autowired
	CategoryService service;
	
	@Test
	public void getCategoryTest() {
		Map<String, Object> maps= service.getCategoryData();
		
		 Set<String> keys = maps.keySet();

		    // 각 키에 대한 값을 조회하여 출력
		    for (String key : keys) {
		        Object value = maps.get(key);
		        System.out.println(key + " : " + value);
		    }
	}
}
