package com.gura.spring05.star.dto;

public class StarDto {
	private int num;
	private String id;
	private String code;
	private double starValue;
	
	public StarDto() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public double getStarValue() {
		return starValue;
	}

	public void setStarValue(double starValue) {
		this.starValue = starValue;
	}

	public StarDto(int num, String id, String code, double starValue) {
		super();
		this.num = num;
		this.id = id;
		this.code = code;
		this.starValue = starValue;
	}

	
}
