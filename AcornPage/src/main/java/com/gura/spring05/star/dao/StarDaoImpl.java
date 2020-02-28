package com.gura.spring05.star.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.star.dto.StarDto;

@Repository
public class StarDaoImpl implements StarDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(StarDto dto) {
//		StarPointDto babo=session.select("star.select", dto);
//		if(babo.getCode()==null) {
//			session.update("star.update", dto);
//		}else {
			session.insert("star.insert", dto);
//		}
	}

	@Override
	public void update(StarDto dto) {
		session.update("star.update", dto);
		
	}




}
