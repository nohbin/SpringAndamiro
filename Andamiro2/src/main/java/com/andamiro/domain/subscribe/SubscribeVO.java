package com.andamiro.domain.subscribe;

import lombok.Data;

@Data
public class SubscribeVO {
	private String sub_start;
	private String sub_end;
	private int subNumber;
	private long memberNumber;
	private int status;
	
	
}
