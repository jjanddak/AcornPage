package com.gura.spring05.star.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.star.dao.StarDao;
import com.gura.spring05.star.dto.StarDto;


@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	private StarDao dao;

	@Override
	public void addStar(String code, int starValue) {
		StarDto dto=new StarDto();
		String id="대희짱짱맨";
		dto.setCode(code);
		dto.setId(id);
		dto.setStarValue(starValue);

		dao.insert(dto);
	}
}
