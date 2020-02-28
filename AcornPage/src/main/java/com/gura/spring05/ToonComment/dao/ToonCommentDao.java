package com.gura.spring05.ToonComment.dao;

import java.util.List;

import com.gura.spring05.toon.dto.ToonCommentDto;

public interface ToonCommentDao {
	public int getSequence();
	public void insert(ToonCommentDto dto);
	public List<ToonCommentDto> getList(String code);	
	public void addLikeCount(ToonCommentDto dto);
	public boolean isLiked(ToonCommentDto dto);
	public void upLikeCount(ToonCommentDto dto);
	public void delLikeCount(ToonCommentDto dto);	
}
