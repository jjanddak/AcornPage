package com.gura.spring05.toonlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;

public interface ToonListService {
	//ToonDetail 리스트를 가져오는 메소드
	public void getToonList(HttpServletRequest request);
	//ToonList 단일 만화 리스트를 가져오는 메소드
	public void getDetailList(HttpServletRequest request,String title);
	//코드값을 통해 데이터를 가져오는 메소드
	public void getCodeDetail(HttpServletRequest request,String code, String title);
	//유저의 Id와 충전할 캐쉬의 값을 전달하는 메소드
	public void cashAdd(HttpServletRequest request,HttpSession session,int cash);
	//LibraryDto를 전달 받아 소장테이블에 저장하는 메소드
	public void buyCodeOne(LibraryDto dto,HttpServletRequest request);
	
	public void buyAll(HttpServletRequest request,String title,int price);
	
	public void buyEach(HttpServletRequest request,List<String> eachCode);
	
	public void getMyToon(String id, ModelAndView mView);
	
	public void list(HttpServletRequest request,String category);
	
	public void getDetailInfo(HttpServletRequest request,String title);

	public void getToonCommentList(HttpServletRequest request,String code);

	public void buyList(HttpServletRequest request);

	public ToonListDto getLastRead(HttpServletRequest request);
	
	public void getMyToonList(String id, HttpServletRequest request);

}
