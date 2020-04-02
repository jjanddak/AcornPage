package com.gura.spring05.toonlist.dto;

public class ToonListDto {
	private int num;
	private String title;
	private String writer;
	private String content;
	private String upload;
	private String hashtag;
	private String toon_novel;
	private String code;
	private String id;
	private String regdate;
	private String permit;
	private boolean isBuy;
	private double starvalue;
	private String thumb;
	private int prevNum; //이전글의 글번호를 담을 필드
	private int nextNum; //다음글의 글번호를 담을 필드
	private int commCount;
	
	public ToonListDto() {}

	public ToonListDto(int num, String title, String writer, String content, String upload, String hashtag,
			String toon_novel, String code, String id, String regdate, String permit, boolean isBuy, double starvalue,
			String thumb, int prevNum, int nextNum,int commCount) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.upload = upload;
		this.hashtag = hashtag;
		this.toon_novel = toon_novel;
		this.code = code;
		this.id = id;
		this.regdate = regdate;
		this.permit = permit;
		this.isBuy = isBuy;
		this.starvalue = starvalue;
		this.thumb = thumb;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.commCount = commCount;
	}

	
	public int getCommCount() {
		return commCount;
	}

	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getToon_novel() {
		return toon_novel;
	}

	public void setToon_novel(String toon_novel) {
		this.toon_novel = toon_novel;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}

	public boolean getIsBuy() {
		return isBuy;
	}

	public void setIsBuy(boolean isBuy) {
		this.isBuy = isBuy;
	}

	public double getStarvalue() {
		return starvalue;
	}

	public void setStarvalue(double starvalue) {
		this.starvalue = starvalue;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
}