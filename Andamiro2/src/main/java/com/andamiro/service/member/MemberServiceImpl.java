package com.andamiro.service.member;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.mapper.MemberMapper;
import com.andamiro.security.domain.CustomUserDetails;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper mapper;
	
	private final PasswordEncoder passwordEncoder;

	@Override
	public CustomUserDetails readMember(String id) {
		// TODO Auto-generated method stub
		return mapper.readMember(id);
	}

	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		int count = mapper.idCheck(id);
		return count;
	}

	@Override
	public void singUp(MemberVO memberVO) {
		// TODO Auto-generated method stub
		String encodedPassword =  passwordEncoder.encode(memberVO.getPwd());
		memberVO.setPwd(encodedPassword);
		mapper.singUp(memberVO);
	}

}