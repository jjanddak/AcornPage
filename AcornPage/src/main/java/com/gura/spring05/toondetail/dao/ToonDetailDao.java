package com.gura.spring05.toondetail.dao;

import java.util.List;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;

public interface ToonDetailDao {

	public List<ToonDetailDto> getWriterDetail(String writer);

	public List<ToonDetailDto> getTitleDetail(String title);

	public List<ToonDetailDto> getHashtagDetail(String hashtag);
	
	public ToonDetailDto getToonDetail(String title);

	public void deleteToon(ToonDetailDto dto);
	
	public void deleteList(ToonDetailDto dto);
	
	public List<String> getCode(String title);
	
	public List<String> needPermit();
	
	public ToonDetailDto getNoPermitDetail(String title);

}
