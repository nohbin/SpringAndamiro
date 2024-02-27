package com.andamiro.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.security.domain.CustomUserDetails;

@Mapper
public interface MemberMapper {

	public CustomUserDetails readMember(String userid);

	public int idCheck(String id) throws DataAccessException;

	public void singUp(MemberVO memberVO);
}
