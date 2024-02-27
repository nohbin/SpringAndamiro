package com.andamiro.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andamiro.domain.event.EventVO;
import com.andamiro.mapper.EventMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService {
	@Setter(onMethod_ = @Autowired)
	private EventMapper mapper;

	@Override
	public void register(EventVO event) {
		log.info("register ************" + event);
		mapper.insertSelectKey(event);

	}
	



	@Override
	public EventVO get(int eventno) {
		log.info("serviceImpl get() ************************"+eventno);		
		return mapper.read(eventno);
	}

	@Override
	public boolean modify(EventVO event) {
		log.info("ServiceImpl modify***************************"+event);
		log.info(event);
		return mapper.update(event) == 1;
	}

	@Override
	public boolean remove(int eventno) {
		log.info("ServiceImple remove :"+ eventno);
		return mapper.delete(eventno) == 1;
	}




	@Override
	public List<EventVO> getList() {
		
		log.info("getList........");
		
		return mapper.getList();
	
	}




	@Override
	public EventVO eventmain(int eventno) {

		return null;
	}




	@Override
	public EventVO eventcontest(int eventno) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public EventVO eventnomal(int eventno) {
		// TODO Auto-generated method stub
		return null;
	}




	


	

}

 