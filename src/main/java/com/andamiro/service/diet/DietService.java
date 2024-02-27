package com.andamiro.service.diet;

import java.util.List;


import com.andamiro.domain.diet.DietVO;

public interface DietService {
	//등록
	public void register(DietVO dietVo);

	//조회
	public DietVO get(int dietNumber);
	
	//수정
	public boolean modify(DietVO dietVo);
	
	//삭제
	public boolean remove(int dietNumber);
	
	//목록 
	public List<DietVO> getList();
}
