package com.andamiro.service.subscribe;

import java.util.List;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.domain.diet.dietDetailVO;


public interface ProDietService {

	public List<DietVO> proDiet();
	public List<dietDetailVO> proName1();
	public List<dietDetailVO> proName2();
	public List<dietDetailVO> proName3();
	public List<dietDetailVO> proDetail();
	
}
