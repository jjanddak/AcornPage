package com.gura.spring05.toonlist.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.toonlist.dto.StarPointDto;

@Repository
public class StarListDaoImpl implements StarListDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(StarPointDto dto) {
		session.insert("star.insert", dto);
	}

	@Override
	public void update(StarPointDto dto) {
		session.update("star.insert", dto);
		
	}

}
