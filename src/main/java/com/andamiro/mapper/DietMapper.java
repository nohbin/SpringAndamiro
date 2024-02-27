package com.andamiro.mapper;

import java.util.List;

import com.andamiro.domain.diet.DietVO;

public interface DietMapper {
	//@Select("select * from diet where dietNumber > 0 ")     : DietMapper.xml ���� �ۼ������Ƿ� �ּ�ó��     
	public List<DietVO> getList();
	public void  insert(DietVO dietVo);
	public DietVO read(int dietNumber);
	public int delete(int dietNumber);
	public int update(DietVO dietVo);
	
}
