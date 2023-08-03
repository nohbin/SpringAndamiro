package com.andamiro.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.andamiro.domain.event.EventVO;

@Component
public interface EventMapper {

	public List<EventVO> getList();

	public void insert(EventVO event);

	public void insertSelectKey(EventVO event);

	public EventVO read(int eventno);

	public int delete(int eventno);

	public int update(EventVO event);
	
	
	}

