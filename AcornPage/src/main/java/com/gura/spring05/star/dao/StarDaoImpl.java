package com.gura.spring05.star.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.star.dto.StarDto;

@Repository
public class StarDaoImpl implements StarDao{

	@Autowired
	private SqlSession session;

	@Override
	public String select(StarDto dto) {
		String starValueResult=session.selectOne("star.selectStarValue", dto);
		//select 된 비밀번호를 리턴해준다. 
		return starValueResult;
	}

	@Override
	public void insert(StarDto dto) { //insert
		session.insert("star.insert", dto);
	}

	@Override
	public void update(StarDto dto) {
		session.update("star.update", dto);
	}

	@Override
	public StarDto selectStarOneAVG(StarDto dto) {
		return session.selectOne("star.selectStarValueOneAVG", dto);
	}

	@Override
	public Object checkMyStar(StarDto dto) {
		return session.selectOne("star.checkMyStar",dto);
				 
	}
}
