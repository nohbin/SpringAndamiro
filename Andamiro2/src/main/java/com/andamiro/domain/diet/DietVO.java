package com.andamiro.domain.diet;

public class DietVO {
	private int dietNumber;
	private int subNumber;
	private String diet_kind;
	private String diet_menu;
	private String diet_picture;
	private dietDetailVO dietDetailVO;

	
	public dietDetailVO getDietDetailVO() {
		return dietDetailVO;
	}
	public void setDietDetailVO(dietDetailVO dietDetailVO) {
		this.dietDetailVO = dietDetailVO;
	}
	public int getDietNumber() {
		return dietNumber;
	}
	public void setDietNumber(int dietNumber) {
		this.dietNumber = dietNumber;
	}
	public int getSubNumber() {
		return subNumber;
	}
	public void setSubNumber(int subNumber) {
		this.subNumber = subNumber;
	}
	public String getDiet_kind() {
		return diet_kind;
	}
	public void setDiet_kind(String diet_kind) {
		this.diet_kind = diet_kind;
	}
	public String getDiet_menu() {
		return diet_menu;
	}
	public void setDiet_menu(String diet_menu) {
		this.diet_menu = diet_menu;
	}
	
	public String getDiet_picture() {
		return diet_picture;
	}
	public void setDiet_picture(String diet_picture) {
		this.diet_picture = diet_picture;
	}

}
