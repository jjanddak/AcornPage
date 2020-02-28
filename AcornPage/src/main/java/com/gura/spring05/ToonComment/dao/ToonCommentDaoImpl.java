package com.gura.spring05.ToonComment.dao;

import java.util.List;

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

	@Override
	public List<ToonCommentDto> getList(String code) {
		return session.selectList("toonComment.getList",code );
	}

	@Override
	public void addLikeCount(ToonCommentDto dto) {
		session.insert("toonComment.addLike", dto );
		
	}

	@Override
	public void delLikeCount(ToonCommentDto dto) {
		session.delete("toonComment.delLike",  dto);
		
	}

	@Override
	public boolean isLiked(ToonCommentDto dto) {
		String id=session.selectOne("toonComment.checkLike",dto);
		if(id==null) {
			return false;
		}else if(id.equals(dto.getId())) {
			return true; //라이크이미해놨다면
		}
		return false;
	}

	@Override
	public void upLikeCount(ToonCommentDto dto) {
		session.update("toonComment.upLike",dto);
		
	}


}
