package com.gura.spring05.users.dto;

public class UsersDto {
	private int num;
	private String id;
	private String pwd;
	private String isWriter;
	private int wallet;
	private String email;
	private String regdate;
	private String profile; //프로필 이미지 경로를 저장할 필드
	private String newPwd; //새로운 비밀번호를 저장할 필드
	private int price;
	private String lastread;
	private String code;
	private int login;
	private String ip;
	
	
	
	
	public UsersDto(int num, String id, String pwd, String isWriter, int wallet, String email, String regdate,
			String profile, String newPwd, int price, String lastread,String code,int login,String ip) {
		super();
		this.num = num;
		this.id = id;
		this.pwd = pwd;
		this.isWriter = isWriter;
		this.wallet = wallet;
		this.email = email;
		this.regdate = regdate;
		this.profile = profile;
		this.newPwd = newPwd;
		this.price = price;
		this.lastread = lastread;
		this.ip = ip;
		this.login = login;
	}

	public int getLogin() {
		return login;
	}

	public void setLogin(int login) {
		this.login = login;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String isWriter() {
		return isWriter;
	}

	public void setWriter(String isWriter) {
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

	public String getIsWriter() {
		return isWriter;
	}

	public void setIsWriter(String isWriter) {
		this.isWriter = isWriter;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public UsersDto() {}


	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getLastread() {
		return lastread;
	}

	public void setLastread(String lastread) {
		this.lastread = lastread;
	}
	
}







