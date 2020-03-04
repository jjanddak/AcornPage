package com.gura.spring05.toondetail.dto;

public class ToonDetailDto {
	private String title;
	private String writer;
	private String info;
	private String regdate;
	private String hashtag;
	private String toonovel;
	
	public ToonDetailDto() {}
	
	

	public ToonDetailDto(String title, String writer, String info, String regdate, String hashtag, String toonovel) {
		super();
		this.title = title;
		this.writer = writer;
		this.info = info;
		this.regdate = regdate;
		this.hashtag = hashtag;
		this.toonovel = toonovel;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getToonovel() {
		return toonovel;
	}

	public void setToonovel(String toonovel) {
		this.toonovel = toonovel;
	}
	
	
}
