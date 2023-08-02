package com.andamiro.domain.recipe;

import lombok.Data;

@Data
public class RecipePicVO {
	private int recipePicid;
	private int recipeId;
	private String mainPicture;
	private String pic1;
	private String pic2;
	private String pic3;
	private String pic4;
	private String pic5;
	String uploadPath;
}
