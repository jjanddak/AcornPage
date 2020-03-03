package com.gura.spring05.toonlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toonlist.dto.ToonListDto;

public interface ToonListService {
	//ToonDetail 리스트를 가져오는 메소드
	public void getToonList(HttpServletRequest request);
	//ToonList 단일 만화 리스트를 가져오는 메소드
	public void getDetailList(HttpServletRequest request,String title);
	//코드값을 통해 데이터를 가져오는 메소드
	public void getCodeDetail(HttpServletRequest request,String code);
	//유저의 Id와 충전할 캐쉬의 값을 전달하는 메소드
	public boolean cashAdd(HttpServletRequest request,int cash);
	//LibraryDto를 전달 받아 소장테이블에 저장하는 메소드
	public void buyCodeOne(LibraryDto dto);
	
	public void buyAll(HttpServletRequest request,String title,int price);
	
	public void buyEach(HttpServletRequest request,List<String> eachCode);
}
