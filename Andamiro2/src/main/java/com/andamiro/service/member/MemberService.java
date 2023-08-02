package com.andamiro.service.member;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.security.domain.CustomUserDetails;

public interface MemberService {
	
	public CustomUserDetails readMember (String id);

	public int idCheck(String id) throws Exception;

	public void singUp(MemberVO memberVO);

}
