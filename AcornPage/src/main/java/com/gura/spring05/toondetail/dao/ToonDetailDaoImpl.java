package com.gura.spring05.toondetail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;

@Component
public class ToonDetailDaoImpl implements ToonDetailDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ToonDetailDto> getWriterDetail(String writer) {
		return session.selectList("toon.getWriterDetail",writer);
	}

	@Override
	public List<ToonDetailDto> getTitleDetail(String title) {
		return session.selectList("toon.getTitleDetail",title);
	}

	@Override
	public List<ToonDetailDto> getHashtagDetail(String hashtag) {
		return session.selectList("toon.getHashtagDetail",hashtag);
	}

	@Override
	public void deleteToon(ToonDetailDto dto) {
		session.delete("toon.deleteDetail",dto);
	}

	@Override
	public void deleteList(ToonDetailDto dto) {
		session.delete("toon.deleteList",dto);
	}

	@Override
	public ToonDetailDto getToonDetail(String title) {
		return session.selectOne("toon.getDetail",title);
	}
	@Override
	public List<String> getCode(String title) {
		
		return session.selectList("toon.getCode",title);
	}

	@Override
	public List<String> needPermit() {
		
		return session.selectList("toon.needPermit");
	}

	@Override
	public ToonDetailDto getNoPermitDetail(String title) {
		
		return session.selectOne("getNoPermitDetail",title);
	}

	@Override
	public void updateDetail(ToonDetailDto dto) {
		session.update("toon.updateDetail",dto);
	}		
}
