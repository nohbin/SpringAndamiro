package com.andamiro.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.andamiro.mapper.CommonMapper;
import com.andamiro.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommonServiceImpl implements CommonService {

	private final CommonMapper commonMapper;

	@Override
	public List<Map<String, Object>> getCategory() {
		// TODO Auto-generated method stub
		return commonMapper.getCategory();
	}

}
