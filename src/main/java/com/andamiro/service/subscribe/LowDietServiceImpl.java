package com.andamiro.service.subscribe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.mapper.LowDietMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class LowDietServiceImpl implements LowDietService{
	
	private LowDietMapper mapper;

	@Override
	public List<DietVO> lowDiet() {
		log.info("simDiet............");
		return mapper.lowDiet();
	}

	@Override
	public List<dietDetailVO> lowName1() {
		log.info("simName1............");
		return mapper.lowName1();
	}

	@Override
	public List<dietDetailVO> lowName2() {
		log.info("simName2............");
		return mapper.lowName2();
	}

	@Override
	public List<dietDetailVO> lowName3() {
		log.info("simName3............");
		return mapper.lowName3();
	}

	@Override
	public List<dietDetailVO> lowDetail() {
		log.info("simDetail.........");
		return mapper.lowDetail();
	}

	
	
	
	

}
