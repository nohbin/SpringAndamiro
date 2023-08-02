package com.andamiro.mapper;

import java.util.List;

import com.andamiro.domain.subscribe.SubscribeVO;

public interface SubscribeMapper {
	public List<SubscribeVO> getSub();
	public void subInsert(SubscribeVO subscribeVo);
	public SubscribeVO subRead(int subNumber);
	public int subDelete(int subNumber);
	public int subFinish(SubscribeVO subscribeVo);
}
