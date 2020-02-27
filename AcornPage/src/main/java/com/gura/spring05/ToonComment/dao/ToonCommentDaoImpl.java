package com.gura.spring05.ToonComment.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.toon.dto.ToonCommentDto;
@Repository
public class ToonCommentDaoImpl implements ToonCommentDao{
	
@Autowired
	private SqlSession session;
	@Override
	public int getSequence() {
		int seq=session.selectOne("toonComment.getSequence");
		return seq;
	}

	@Override
	public void insert(ToonCommentDto dto) {
		session.insert("toonComment.insert", dto);	
	}

}
