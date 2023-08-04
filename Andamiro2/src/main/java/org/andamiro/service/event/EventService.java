package org.andamiro.service.event;

import java.util.List;

import com.andamiro.domain.event.EventVO;


public interface EventService {
	public void register(EventVO event);
	public EventVO get(int eventno);
	public boolean modify(EventVO event);
	public boolean remove(int eventno);
	public List<EventVO> getList();
	EventVO eventmain(int eventno);
	EventVO eventcontest(int eventno);
	EventVO eventnomal(int eventno);
	
}


