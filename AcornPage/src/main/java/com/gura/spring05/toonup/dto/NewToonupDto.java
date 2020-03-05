package com.gura.spring05.toonup.dto;

import org.springframework.web.multipart.MultipartFile;

public class NewToonupDto {
	private String title;
	private String writer;
	private String info;
	private String hashtag;
	private String toonovel;
	private String thumb;
	private MultipartFile File;
	
	public NewToonupDto() {}

	public NewToonupDto(String title, String writer, String info, String hashtag, String toonovel, String thumb,
			MultipartFile file) {
		super();
		this.title = title;
		this.writer = writer;
		this.info = info;
		this.hashtag = hashtag;
		this.toonovel = toonovel;
		this.thumb = thumb;
		File = file;
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

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public MultipartFile getFile() {
		return File;
	}

	public void setFile(MultipartFile file) {
		File = file;
	}
	
	
}