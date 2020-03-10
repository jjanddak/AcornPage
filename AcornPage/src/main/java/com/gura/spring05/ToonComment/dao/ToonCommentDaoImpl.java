package com.gura.spring05.ToonComment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.cafe.dto.CafeDto;
import com.gura.spring05.toon.dto.CommentLikeDto;
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
	public List<ToonCommentDto> getList(ToonCommentDto dto) {
		return session.selectList("toonComment.getList",dto );
	}

	@Override
	public void addLikeCount(CommentLikeDto dto) {
		session.insert("toonComment.addLike", dto );
		
	}

	@Override
	public void delLikeCount(CommentLikeDto dto) {
		session.delete("toonComment.delLike",  dto);
		
	}

	@Override
	public boolean isLiked(CommentLikeDto dto) {
		String id=session.selectOne("toonComment.checkLike",dto);
		if(id==null) { //라이크를 누르지 않았다면
			return false;
		}
		return true;
	}

	@Override
	public void upLikeCount(String commcode) {
		session.update("toonComment.upLike",commcode);
		
	}

	@Override
	public void downLikeCount(String commcode) {
		session.update("toonComment.downLike",commcode);
		
	}
	@Override
	public int getCount(ToonCommentDto dto) {
		return session.selectOne("toonComment.getCount", dto);
	}



}
