package com.andamiro.domain.diet;

public class dietDetailVO {
	private int dietDetailID;
	private int dietNumber;
	private String foodName;
	private String kcal;
	private String component;
	
	public int getDietDetailID() {
		return dietDetailID;
	}
	public void setDietDetailID(int dietDetailID) {
		this.dietDetailID = dietDetailID;
	}
	public int getDietNumber() {
		return dietNumber;
	}
	public void setDietNumber(int dietNumber) {
		this.dietNumber = dietNumber;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getComponent() {
		return component;
	}
	public void setComponent(String component) {
		this.component = component;
	}
}
