package com.gura.spring05.ToonComment.service;

import javax.servlet.http.HttpServletRequest;

public interface ToonCommentService {

	public void saveComment(HttpServletRequest request);

	public void addLikeCount(HttpServletRequest request);

}
