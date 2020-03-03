package com.gura.spring05.toonup.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.toonup.dto.ToonupDto;

@Repository
public class ToonupDaoImpl implements ToonupDao{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public void insert(ToonupDto dto) {
		session.insert("toon.upload",dto);
	}
	
}
