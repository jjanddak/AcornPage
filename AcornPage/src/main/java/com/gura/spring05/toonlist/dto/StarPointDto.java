package com.gura.spring05.toonlist.dto;

public class StarPointDto {
	private int num;
	private String id;
	private String code;
	private double starpoint;
	
	public StarPointDto() {}

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

	public double getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}

	public StarPointDto(int num, String id, String code, double starpoint) {
		super();
		this.num = num;
		this.id = id;
		this.code = code;
		this.starpoint = starpoint;
	};
	
	
}
