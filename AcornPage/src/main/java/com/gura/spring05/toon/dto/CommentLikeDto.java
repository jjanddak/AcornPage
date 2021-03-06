package com.gura.spring05.toon.dto;

public class CommentLikeDto {
	private int num;
	private String id;
	private String commcode;
	private String regdate;
	private String code;
	private boolean isLike;
	public CommentLikeDto() {};
	public CommentLikeDto(int num, String id, String commcode, String regdate,String code,boolean isLike) {
		super();
		this.num = num;
		this.id = id;
		this.commcode = commcode;
		this.regdate = regdate;
		this.code=code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}



}
