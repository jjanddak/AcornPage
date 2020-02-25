package com.gura.spring05.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.cafe.dto.CafeDto;
import com.gura.spring05.info.dto.InfoDto;
import com.gura.spring05.toon.dto.ToonDto;

@Repository
public class CafeDaoImpl implements CafeDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int getCount(CafeDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("cafe.getCount", dto);
	}

	@Override
	public List<CafeDto> getList(CafeDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.getList", dto);
	}

	@Override
	public void insert(CafeDto dto) {
		session.insert("cafe.insert", dto);
	}

	@Override
	public CafeDto getData(CafeDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("cafe.getData", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("cafe.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("cafe.delete", num);
	}

	@Override
	public CafeDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("cafe.getData2", num);
	}

	@Override
	public void update(CafeDto dto) {
		session.update("cafe.update", dto);
	}
	@Override
	public List<InfoDto> getList2(InfoDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.getList2", dto);
	}

	@Override
	public List<ToonDto> getList3(String title) {
		return session.selectList("cafe.getList3", title);
	}

	@Override
	public ToonDto getCodeData(String code) {
		
		return session.selectOne("cafe.getCodeData", code);
	}

	@Override
	public boolean cashUpdate(int cash) {
		// TODO Auto-generated method stub
		session.update("cafe.CashUpdate",cash);
		
		return true;
	}
}
