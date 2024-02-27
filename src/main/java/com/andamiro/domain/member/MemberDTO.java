package com.andamiro.domain.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDTO {
	
	  
	  private int memberNumber;
	  private String id;
	  private String pwd;
	  private String name;
	  private String phone;
	  private String email;
	  private Timestamp joingDate;
	  private String subscribe;
	  
	  
	  
	  
}
