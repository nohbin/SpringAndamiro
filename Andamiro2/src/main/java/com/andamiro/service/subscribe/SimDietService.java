package com.andamiro.service.subscribe;

import java.util.List;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;


public interface SimDietService {

	public List<DietVO> simDiet();
	public List<dietDetailVO> simName1();
	public List<dietDetailVO> simName2();
	public List<dietDetailVO> simName3();
	public List<dietDetailVO> simDetail();
	
}
