package com.gura.spring05.toonup.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.file.dto.FileDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonup.dto.NewToonupDto;
import com.gura.spring05.toonup.dto.ToonupDto;
import com.gura.spring05.users.dto.UsersDto;

@Repository
public class ToonupDaoImpl implements ToonupDao{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public void insert(ToonupDto dto) {
		session.insert("toon.upload",dto);
	}

	@Override
	public int getLastNum(String title) {
		Integer num=session.selectOne("toon.getLastNum",title);
		if(num==null) {
			num=0;
			return num;			
		}else {
			return num;
		}		
	}
	
	@Override
	public void newToonupload(NewToonupDto dto) {
		session.insert("toon.newToonup", dto);
	}

	@Override
	public void writerLibrary(ToonupDto dto) {
		session.insert("toon.writerLibrary",dto);
	}
}
