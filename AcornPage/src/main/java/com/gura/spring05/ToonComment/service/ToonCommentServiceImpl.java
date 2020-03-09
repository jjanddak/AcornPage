package com.gura.spring05.ToonComment.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.ToonComment.dao.ToonCommentDao;
import com.gura.spring05.toon.dto.CommentLikeDto;
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
		String code=(String)request.getParameter("code");
		//댓글의 내용
		String content=request.getParameter("content");
		//댓글고유코드
		String commcode=code+"com"+seq;

		//댓글 정보를 Dto 에 담기get
		
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
		String writer=(String)request.getParameter("writer");
		String code=(String)request.getParameter("code");
		String id=(String)request.getSession()
				.getAttribute("id");	
		//검증에 사용할 dto
		CommentLikeDto dto=new CommentLikeDto();
		dto.setId(id);
		dto.setCommcode(commcode);
		dto.setCode(code);
		boolean isLiked=dao.isLiked(dto); 	
		if(isLiked) { //라이크를 이미 눌렀다면
			dao.downLikeCount(commcode);
			dao.delLikeCount(dto);
			
		}else {
			dao.upLikeCount(commcode);
			dao.addLikeCount(dto);
			
		}

		
	}



}
