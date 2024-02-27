package com.andamiro.service.subscribe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.mapper.LowDietMapper;
import com.andamiro.mapper.ProDietMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProDietServiceImpl implements ProDietService{
	
	private ProDietMapper mapper;

	@Override
	public List<DietVO> proDiet() {
		log.info("simDiet............");
		return mapper.proDiet();
	}

	@Override
	public List<dietDetailVO> proName1() {
		log.info("simName1............");
		return mapper.proName1();
	}

	@Override
	public List<dietDetailVO> proName2() {
		log.info("simName2............");
		return mapper.proName2();
	}

	@Override
	public List<dietDetailVO> proName3() {
		log.info("simName3............");
		return mapper.proName3();
	}

	@Override
	public List<dietDetailVO> proDetail() {
		log.info("simDetail.........");
		return mapper.proDetail();
	}
	

}
