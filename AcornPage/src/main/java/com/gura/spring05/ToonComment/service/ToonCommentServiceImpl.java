package com.gura.spring05.ToonComment.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.ToonComment.dao.ToonCommentDao;
import com.gura.spring05.toon.dto.ToonCommentDto;

@Service
public class ToonCommentServiceImpl implements ToonCommentService{
	@Autowired
	private ToonCommentDao dao;

	
	@Override
	public void saveComment(HttpServletRequest request) {
		
		//저장할 댓글의 primary key 값으로 사용할 시퀀스 불러오기
		int seq = dao.getSequence();	
		//댓글 작성자
		String id=(String)request.getSession()
				.getAttribute("id");
		//댓글단 만화의 코드
		String code="1";
		//댓글의 내용
		String content=request.getParameter("content");
		//댓글고유코드
		String commcode=seq+code;

		//댓글 정보를 Dto 에 담기
		ToonCommentDto dto=new ToonCommentDto();
		dto.setNum(seq);
		dto.setId(id);
		dto.setCode(code);
		dto.setContent(content);
		dto.setCommcode(commcode);
		
		//댓글 정보를 DB 에 저장한다.
		dao.insert(dto);					
	}
	
	@Override
	public void addLikeCount(HttpServletRequest request) {
		String commcode=(String)request.getParameter("commcode");
		String id=(String)request.getSession()
				.getAttribute("id");	
		//검증에 사용할 dto
		ToonCommentDto dto=new ToonCommentDto();
		dto.setId(id);
		dto.setCommcode(commcode);
		boolean isLiked=dao.isLiked(dto); 
		//id로 쓴 모든 댓글 dto2
		ToonCommentDto dto2= dao.getComment(dto);
		
		if(isLiked) { //라이크를 이미 눌렀다면
			dao.downLikeCount(dto2);
			dao.delLikeCount(dto);
			
		}else {
			dao.upLikeCount(dto2);
			dao.addLikeCount(dto);
			
		}

		
	}



}
