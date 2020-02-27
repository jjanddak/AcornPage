package com.gura.spring05.toon.dto;

public class ToonCommentDto {
	private int num;
	private String id;
	private String code;
	private String content;
	private int likecount;
	private String commcode;
	private String regdate;
	
	public ToonCommentDto(){};
	public ToonCommentDto(int num, String id, String code, String content, int likecount, String commcode,
			String regdate) {
		super();
		this.num = num;
		this.id = id;
		this.code = code;
		this.content = content;
		this.likecount = likecount;
		this.commcode = commcode;
		this.regdate = regdate;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
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
	
}
