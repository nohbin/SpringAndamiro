package com.andamiro.mapper;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.andamiro.domain.subscribe.SubscribeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SubscribeMapperTests {
	
	@Setter(onMethod_ = @Autowired )
	private SubscribeMapper subMapper;
	
	@Test
	public void testSubInsert() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(currentTime) ;
		calendar.add(Calendar.DAY_OF_MONTH, 30);   //현재 날짜에서 30일을 더함 
		Date endDate = calendar.getTime();
		String sub_start = dateFormat.format(currentTime);
		String sub_end = dateFormat.format(endDate);
		SubscribeVO subscribeVo = new SubscribeVO();
		subscribeVo.setMemberNumber(5);
		subscribeVo.setSub_start(sub_start);
		subscribeVo.setSub_start(sub_end);
		subscribeVo.setStatus(1);
		
		subMapper.subInsert(subscribeVo);
		log.info(subscribeVo);
		
		
	}
}
