package com.andamiro.service.diet;

import java.util.List;

import com.andamiro.domain.diet.dietDetailVO;

public interface DietDetailService {
	public void register(dietDetailVO detail);
	public dietDetailVO get(int dietDetailID);
	public boolean modify(dietDetailVO detail);
	public boolean remove(int dietDetailID);
	public List<dietDetailVO> getList();
}
