package com.andamiro.service.subscribe;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.mapper.RecDietMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class RecDietServiceImpl implements RecDietService{
	
	private RecDietMapper mapper;
	
	@Override
	public List<DietVO> recDiet() {
		log.info("recDiet......");
		
		
		return mapper.recDiet();
	}

	@Override
	public List<dietDetailVO> recName1() {
		log.info("recName1.......");
		return mapper.recName1();
	}

	@Override
	public List<dietDetailVO> recName2() {
		log.info("recName2.......");
		return mapper.recName2();
	}

	@Override
	public List<dietDetailVO> recName3() {
		log.info("recName3.......");
		return mapper.recName3();
	}

	@Override
	public List<dietDetailVO> recDetail() {
		log.info("recDetail.......");
		return mapper.recDetail();
	}

	
	
	
	

}
