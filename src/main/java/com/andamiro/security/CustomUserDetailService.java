package com.andamiro.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.andamiro.domain.member.MemberVO;
import com.andamiro.mapper.MemberMapper;
import com.andamiro.security.domain.CustomUser;
import com.andamiro.security.domain.CustomUserDetails;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService  implements UserDetailsService  {

		@Autowired
		private MemberMapper mapper;

		@Override
		public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			// TODO Auto-generated method stub
			
			log.warn("Load User By UserName : " + username);
			
			//userName means userId
			
			CustomUserDetails member = mapper.readMember(username);
			if(member==null) {
				throw new UsernameNotFoundException(username);
			}
			log.warn("queried by member mapper : " + member);
			
			
			return member;
		}
		
}
