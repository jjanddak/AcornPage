package com.gura.spring05.toonlist.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.toonlist.dao.StarListDao;
import com.gura.spring05.toonlist.dto.StarPointDto;


@Service
public class StarListServiceImpl implements StarListService{
	
	@Autowired
	private StarListDao dao;

	@Override
	public void addStar(String code, int starValue) {
		StarPointDto dto=new StarPointDto();
		String id="대희짱짱맨";
		dto.setCode(code);
		dto.setId(id);
		dto.setStarValue(starValue);

		dao.insert(dto);
	}
}
