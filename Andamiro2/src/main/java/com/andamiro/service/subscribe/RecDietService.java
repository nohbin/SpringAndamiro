package com.andamiro.service.subscribe;

import java.util.List;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;


public interface RecDietService {

	public List<DietVO> recDiet();
	public List<dietDetailVO> recName1();
	public List<dietDetailVO> recName2();
	public List<dietDetailVO> recName3();
	public List<dietDetailVO> recDetail();
	
}
