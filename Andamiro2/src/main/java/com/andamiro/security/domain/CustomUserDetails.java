package com.andamiro.security.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.andamiro.domain.member.AuthVO;

public class CustomUserDetails implements UserDetails {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long memberNumber;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Timestamp joinDate; 
	private String subscribe;
	private String adminCode;
	private List<AuthVO> authList;
	private String AUTHORITY;
	private boolean ENABLED;
	
	
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(AUTHORITY));
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return pwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	public Long getMemberNumber() {
		return memberNumber;
	}

	public String getAUTHORITY() {
		return AUTHORITY;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public String getSubscribe() {
		return subscribe;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public List<AuthVO> getAuthList() {
		return authList;
	}

	public boolean isENABLED() {
		return ENABLED;
	}
	
	
	

}
