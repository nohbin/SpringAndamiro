package com.andamiro.service.subscribe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.mapper.SimDietMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class SimDietServiceImpl implements SimDietService{
	
	private SimDietMapper mapper;

	@Override
	public List<DietVO> simDiet() {
		log.info("simDiet............");
		return mapper.simDiet();
	}

	@Override
	public List<dietDetailVO> simName1() {
		log.info("simName1............");
		return mapper.simName1();
	}

	@Override
	public List<dietDetailVO> simName2() {
		log.info("simName2............");
		return mapper.simName2();
	}

	@Override
	public List<dietDetailVO> simName3() {
		log.info("simName3............");
		return mapper.simName3();
	}

	@Override
	public List<dietDetailVO> simDetail() {
		log.info("simDetail.........");
		return mapper.simDetail();
	}

	
	
	
	

}
