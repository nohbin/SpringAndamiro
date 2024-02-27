package com.andamiro.mapper;

import java.util.List;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;

public interface RecDietMapper {
	
	public List<DietVO> recDiet();
	public List<dietDetailVO> recName1();
	public List<dietDetailVO> recName2();
	public List<dietDetailVO> recName3();
	public List<dietDetailVO> recDetail();
}
