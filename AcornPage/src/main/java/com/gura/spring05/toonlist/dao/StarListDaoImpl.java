package com.gura.spring05.toonlist.dao;

import java.util.List;

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
//		StarPointDto babo=session.select("star.select", dto);
//		if(babo.getCode()==null) {
//			session.update("star.update", dto);
//		}else {
			session.insert("star.insert", dto);
//		}
	}

	@Override
	public void update(StarPointDto dto) {
		session.update("star.update", dto);
		
	}




}
