package com.andamiro.domain.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)

public class BoardVO {
	private int cno;
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date modDate;
	private Long readCount;
	private Long recommendCount;
	private Long replyCount;
	
}
