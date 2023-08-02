package com.andamiro.domain.member;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

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
	
	
	
}

