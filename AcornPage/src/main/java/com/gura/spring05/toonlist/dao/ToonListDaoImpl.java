package com.gura.spring05.toonlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;
@Repository
public class ToonListDaoImpl implements ToonListDao{
	
	@Autowired
	private SqlSession session;
	@Override
	public List<ToonDetailDto> getToonList(ToonDetailDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("toon.getToonList", dto);
	}

	@Override
	public List<ToonListDto> getDetailList(String title) {
		return session.selectList("toon.getDetailList", title);
	}

	@Override
	public ToonListDto getCodeDetail(String code) {
		
		return session.selectOne("toon.getCodeDetail", code);
	}

	@Override
	public boolean cashUpdate(int cash) {

		session.update("toon.CashUpdate",cash);
		
		return true;
	}
}
