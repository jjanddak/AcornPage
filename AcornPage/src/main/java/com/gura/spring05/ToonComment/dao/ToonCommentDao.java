package com.gura.spring05.ToonComment.dao;

import java.util.List;

import com.gura.spring05.toon.dto.CommentLikeDto;
import com.gura.spring05.toon.dto.ToonCommentDto;

public interface ToonCommentDao {
	public int getSequence();
	public void insert(ToonCommentDto dto);
	public List<ToonCommentDto> getList(String code);	
	public void addLikeCount(CommentLikeDto dto);
	public boolean isLiked(CommentLikeDto dto);
	public void upLikeCount(String commcode);
	public void delLikeCount(CommentLikeDto dto);
	public void downLikeCount(String commcode);
	
	
}
