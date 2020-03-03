package com.gura.spring05.users.dto;

public class UsersDto {
	private int num;
	private String id;
	private String pwd;
	private boolean isWriter;
	private int wallet;
	private String regdate;
	private String profile; //프로필 이미지 경로를 저장할 필드
	private String newPwd; //새로운 비밀번호를 저장할 필드
	
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public boolean isWriter() {
		return isWriter;
	}

	public void setWriter(boolean isWriter) {
		this.isWriter = isWriter;
	}

	public int getWallet() {
		return wallet;
	}

	public void setWallet(int wallet) {
		this.wallet = wallet;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public UsersDto() {}

	
}







