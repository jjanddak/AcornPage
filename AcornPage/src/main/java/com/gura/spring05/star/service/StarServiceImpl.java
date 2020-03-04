package com.gura.spring05.star.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.star.dao.StarDao;
import com.gura.spring05.star.dto.StarDto;
import com.gura.spring05.toonlist.dto.ToonListDto;

@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	private StarDao dao;

	@Override
	public void addStar(StarDto dto) {
		
		String starValueResult=dao.select(dto);
		if(starValueResult==null||starValueResult=="") {
			dao.insert(dto);
		}else if(starValueResult!=null){
			dao.update(dto);
		}
	}

	@Override
	public void selectStarValueOneAVG(HttpServletRequest request, String code) {
		
		StarDto dto= new StarDto();
		dto.setCode(code);
		double starvalueAVG=dao.selectStarOneAVG(dto);
		
		request.setAttribute("starvalueAVG", starvalueAVG);
	}
}
