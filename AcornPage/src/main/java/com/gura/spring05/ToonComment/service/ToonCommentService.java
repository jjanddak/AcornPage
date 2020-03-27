package com.gura.spring05.ToonComment.service;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.toon.dto.CommentLikeDto;
import com.gura.spring05.toon.dto.ToonCommentDto;

public interface ToonCommentService {

	public void saveComment(HttpServletRequest request);

	public boolean addLikeCount(HttpServletRequest request,CommentLikeDto dto);

	public boolean deleteComment(HttpServletRequest request, int num);
	
}
