package com.andamiro.service.diet;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.DietVO;
import com.andamiro.mapper.DietMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DietServiceImpl implements DietService {

	private DietMapper dietMapper;
	@Override
	public void register(DietVO dietVo) {
		log.info("register........"+ dietVo);
		dietMapper.insert(dietVo);
	}
	
	

	@Override
	public DietVO get(int dietNumber) {
		log.info("get......." + dietNumber);
		return dietMapper.read(dietNumber);
	}

	@Override
	//정상적으로 수정 이루어지면 1 반환 
	public boolean modify(DietVO dietVo) {
		log.info("modify......." + dietVo);
		return dietMapper.update(dietVo) == 1;
	}

	@Override
	//정상적으로 삭제 이루어지면 1 반환 
	public boolean remove(int dietNumber) {
		log.info("remove......." + dietNumber);
		return dietMapper.delete(dietNumber)==1;
	}

	@Override
	public List<DietVO> getList() {
		log.info("getList.........");
		return dietMapper.getList();
	}

}
