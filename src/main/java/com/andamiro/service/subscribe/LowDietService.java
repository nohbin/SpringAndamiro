package com.andamiro.service.subscribe;

import java.util.List;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;


public interface LowDietService {

	public List<DietVO> lowDiet();
	public List<dietDetailVO> lowName1();
	public List<dietDetailVO> lowName2();
	public List<dietDetailVO> lowName3();
	public List<dietDetailVO> lowDetail();
	
}
