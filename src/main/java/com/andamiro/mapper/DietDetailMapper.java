package com.andamiro.mapper;

import java.util.List;

import com.andamiro.domain.diet.dietDetailVO;

public interface DietDetailMapper {
	public List<dietDetailVO> getList();
	public void  insert(dietDetailVO deitDetailVo);
	public dietDetailVO read(int dietDetailID);
	public int delete(int dietDetailID);
	public int update(dietDetailVO dietDetaVo);
}
