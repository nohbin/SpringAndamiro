package com.andamiro.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.mapper.MemberMapper;
import com.andamiro.security.MemeberTests;
import com.andamiro.security.domain.CustomUserDetails;
import com.andamiro.service.member.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTests {
	
	@Autowired
	private MemberService service;
	
//	@Test
	public void testRead() throws Exception {
		
		int a = service.idCheck("admin90");
		log.info(a);
		
	}
	
//	@Test
	public void testRead2() throws Exception {
		
		
		CustomUserDetails vo = service.readMember("admin90");
		
		log.info(vo);
		
	}
	
	@Test
	public void testInsert () {
		MemberVO member = new MemberVO();
		member.setId("test2");
		member.setName("testName2");
		member.setPwd("testPwd2");
		member.setEmail("test2@test.com");
		member.setPhone("010-2222-2222");
		
		service.singUp(member);
		
	}
	
	
	

}
