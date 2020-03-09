package com.gura.spring05.ToonComment.service;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.toon.dto.CommentLikeDto;

public interface ToonCommentService {

	public void saveComment(HttpServletRequest request);

	public boolean addLikeCount(HttpServletRequest request,CommentLikeDto dto);
	
}
