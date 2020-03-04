package com.gura.spring05.toondetail.dao;

import java.util.List;

import com.gura.spring05.toondetail.dto.ToonDetailDto;

public interface ToonDetailDao {

	public List<ToonDetailDto> getWriterDetail(String writer);

	public List<ToonDetailDto> getTitleDetail(String title);

	public List<ToonDetailDto> getHashtagDetail(String hashtag);

}
