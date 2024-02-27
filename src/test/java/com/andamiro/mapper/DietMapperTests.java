
package com.andamiro.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.diet.DietVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DietMapperTests {
	@Setter(onMethod_ = @Autowired )
	private DietMapper dietMapper;
	
	@Test
	public void testGetList() {
		dietMapper.getList().forEach(diet -> log.info(diet));
	}
	
	@Test
	public void testInsert() {
		DietVO diet = new DietVO();
		diet.setDiet_kind("���� �ۼ��� �Ĵ� ����");
		diet.setDiet_menu("���� �ۼ��� �Ĵ� �޴�");
		diet.setDiet_picture("food.jpg");
		
		dietMapper.insert(diet);
		log.info(diet);
		
	
	}
	
	@Test
	public void testRead() {
		DietVO diet = dietMapper.read(11);
		log.info(diet);
	
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : "+ dietMapper.delete(13));
	
	}
	
	@Test
	public void testUpdate() {
		DietVO dietVo = new DietVO();
		dietVo.setDietNumber(14);
		dietVo.setDiet_kind("������ �Ĵ� ����");
		dietVo.setDiet_menu("������ �Ĵ� �޴�");
		dietVo.setDiet_picture("������ �Ĵ� ����");
		
		int count = dietMapper.update(dietVo);
		log.info("UPDATE COUNT : "+ count);
		
		
	
	}
}

