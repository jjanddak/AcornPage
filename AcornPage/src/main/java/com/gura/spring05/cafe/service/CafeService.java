package com.gura.spring05.cafe.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.cafe.dto.CafeCommentDto;
import com.gura.spring05.cafe.dto.CafeDto;

public interface CafeService {
	public void getList(HttpServletRequest request);
	public void getList2(HttpServletRequest request);
	public void getList3(HttpServletRequest request,String title);
	//코드값을 통해 데이터를 가져오는 메소드
	public void getCodeDetail(HttpServletRequest request,String code);
	//유저의 Id와 충전할 캐쉬의 값을 전달하는 메소드
	public void cashAdd(HttpServletRequest request,int cash);
	
	public void saveContent(CafeDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num, HttpServletRequest request);
	//원글 수정폼 출력에 필요한 메소드 
	public void getUpdateData(ModelAndView mView, int num);
	//원글 수정하는 메소드 
	public void updateContent(CafeDto dto);	
	//댓글 저장하는 메소드
	public void saveComment(HttpServletRequest request);
	//댓글 삭제하는 메소드
	public void deleteComment(int num);
	//댓글 수정하는 메소드
	public void updateComment(CafeCommentDto dto);
}








