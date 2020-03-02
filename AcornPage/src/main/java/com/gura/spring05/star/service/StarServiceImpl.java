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
	public void addStar(String code, int starValue,HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		StarDto dto=new StarDto();
		dto.setId(id);
		dto.setCode(code);
		dto.setStarValue(starValue);
		
		String starValueResult=dao.select(dto.getId());
		if(starValueResult==null) {
			dao.insert(dto);
		}else if(starValueResult!=null){
			dao.update(dto);
		}
	}
}
