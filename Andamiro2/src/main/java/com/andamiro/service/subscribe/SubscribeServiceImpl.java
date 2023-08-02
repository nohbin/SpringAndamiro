package com.andamiro.service.subscribe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.subscribe.SubscribeVO;
import com.andamiro.mapper.SubscribeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class SubscribeServiceImpl implements SubscribeService{

	private SubscribeMapper subMapper;
	
	@Override
	public void register(SubscribeVO subscribeVo) {
		log.info("register......."+subscribeVo);
		subMapper.subInsert(subscribeVo);
	}

	@Override
	public SubscribeVO get(int subNumber) {
		log.info("get........"+subNumber);
		return subMapper.subRead(subNumber);
	}

	@Override
	public boolean modify(SubscribeVO subscribeVo) {
		log.info("modify......"+subscribeVo);
		return subMapper.subFinish(subscribeVo) == 1;
	}

	@Override
	public boolean remove(int subNumber) {
		log.info("remove....."+subNumber);
		return subMapper.subDelete(subNumber) == 1;
	}

	@Override
	public List<SubscribeVO> getList() {
		log.info("getList......");
		return subMapper.getSub();
	}

}
