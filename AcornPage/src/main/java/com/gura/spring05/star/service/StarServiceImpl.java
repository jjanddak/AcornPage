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
		StarDto dto2=dao.selectStarOneAVG(dto);
		if(dto2==null) {
			request.setAttribute("starvalueAVG", 0);
		}else {
			request.setAttribute("starvalueAVG", dto2.getStarValue());
		}
		
		
	}

	@Override
	public void checkMyStar(HttpServletRequest request, String code) {
		String id=(String)request.getSession().getAttribute("id");
		StarDto dto=new StarDto();
		dto.setId(id);
		dto.setCode(code);
		Object myStar=dao.checkMyStar(dto);
		if(myStar==null) {
			int star=0;
			request.setAttribute("myStar", star);
		}else {
			request.setAttribute("myStar", myStar);
		}
		
		
	}

}
