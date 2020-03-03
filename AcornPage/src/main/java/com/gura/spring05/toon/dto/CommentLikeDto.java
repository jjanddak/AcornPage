package com.gura.spring05.toon.dto;

public class CommentLikeDto {
	private int num;
	private String id;
	private String commcode;
	private String regdatel;
	public CommentLikeDto() {};
	public CommentLikeDto(int num, String id, String commcode, String regdatel) {
		super();
		this.num = num;
		this.id = id;
		this.commcode = commcode;
		this.regdatel = regdatel;
	}
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
	public String getCommcode() {
		return commcode;
	}
	public void setCommcode(String commcode) {
		this.commcode = commcode;
	}
	public String getRegdatel() {
		return regdatel;
	}
	public void setRegdatel(String regdatel) {
		this.regdatel = regdatel;
	}


}
