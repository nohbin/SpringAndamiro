package com.andamiro.service.diet;

import java.util.List;

import org.springframework.stereotype.Service;

import com.andamiro.domain.diet.dietDetailVO;
import com.andamiro.mapper.DietDetailMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DietDetailServiceImpl implements DietDetailService {
	
	private DietDetailMapper mapper;
	
	@Override
	public void register(dietDetailVO detail) {
		log.info("register....."+detail);
		mapper.insert(detail);  
	}

	@Override
	public dietDetailVO get(int dietDetailID) {
		log.info("get............"+dietDetailID);
		return mapper.read(dietDetailID);
	}

	@Override
	//정상적으로 수정 이루어지면 1 반환 
	public boolean modify(dietDetailVO detail) {
		log.info("modify......"+detail);
		
		return mapper.update(detail) == 1;
	}

	@Override 
	//정상적으로 삭제 이루어지면 1 반환 
	public boolean remove(int dietDetailID) {
		log.info("remove.........."+dietDetailID);
		return mapper.delete(dietDetailID)==1;
	}

	@Override
	public List<dietDetailVO> getList() {
		log.info("getList.....");
		return mapper.getList();   
	}

}
