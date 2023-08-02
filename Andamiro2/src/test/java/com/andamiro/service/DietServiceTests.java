package com.andamiro.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.service.diet.DietService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DietServiceTests {
	@Autowired
	private DietService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		DietVO dietVo = new DietVO();
		dietVo.setDiet_kind("���� ����� �Ĵ� ����");
		dietVo.setDiet_menu("���� ����� �Ĵ� �޴�");
		dietVo.setDiet_picture("���� ����� �Ĵ� ����");
		
		service.register(dietVo);
		
		log.info("������ �Խù��� ��ȣ : "+ dietVo.getDietNumber());
		
	
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(diet -> log.info(diet));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(14));
	}
	
	@Test
	public void testUpdate() {
		DietVO diet = service.get(14);
		if(diet == null) {
			return;
		}
		
		diet.setDiet_kind("�� �� ������ �Ĵ� ����");
		log.info("MODIFY RESULT : "+ service.modify(diet));
		
	
	}
}
