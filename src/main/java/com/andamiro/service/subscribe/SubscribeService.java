package com.andamiro.service.subscribe;

import java.util.List;

import com.andamiro.domain.subscribe.SubscribeVO;

public interface SubscribeService {
	
	public void register(SubscribeVO subscribeVo);
	public SubscribeVO get(int subNumber);
	public boolean modify(SubscribeVO subscribeVo);
	public boolean remove(int subNumber);
	public List<SubscribeVO> getList();

}
