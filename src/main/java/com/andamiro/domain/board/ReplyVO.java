package com.andamiro.domain.board;

import java.util.Date;

import lombok.Data;


@Data
//@JsonInclude(JsonInclude.Include.NON_NULL)
public class ReplyVO {
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date modDate;
	
	private Long recommendCount;
}
