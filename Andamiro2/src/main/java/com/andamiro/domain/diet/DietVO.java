package com.andamiro.domain.diet;

import lombok.Data;

@Data
public class DietVO {
	private int dietNumber;
	private int subNumber;
	private String diet_kind;
	private String diet_menu;
	private String diet_picture;
	private dietDetailVO dietDetailVO;

	
	
}
