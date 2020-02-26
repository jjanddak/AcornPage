package com.gura.spring05.library.dto;

public class LibraryDto {
	private int num;
	private String id;
	private String code;
	private String regdate;
	
	public LibraryDto() {}

	public LibraryDto(int num, String id, String code, String regdate) {
		super();
		this.num = num;
		this.id = id;
		this.code = code;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
