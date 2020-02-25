package com.gura.spring05.toonlist.service;

import javax.servlet.http.HttpServletRequest;

public interface ToonListService {
	//ToonDetail 리스트를 가져오는 메소드
	public void getToonList(HttpServletRequest request);
	//ToonList 단일 만화 리스트를 가져오는 메소드
	public void getDetailList(HttpServletRequest request,String title);
	//코드값을 통해 데이터를 가져오는 메소드
	public void getCodeDetail(HttpServletRequest request,String code);
	//유저의 Id와 충전할 캐쉬의 값을 전달하는 메소드
	public boolean cashAdd(HttpServletRequest request,int cash);
}
