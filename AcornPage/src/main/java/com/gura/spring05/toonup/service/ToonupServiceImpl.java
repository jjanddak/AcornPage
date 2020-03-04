package com.gura.spring05.toonup.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toonup.dao.ToonupDao;
import com.gura.spring05.toonup.dto.ToonupDto;

@Service
public class ToonupServiceImpl implements ToonupService{
	@Autowired
	private ToonupDao dao;

	@Override
	public void saveToon(ToonupDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getLastNum(HttpServletRequest request, ModelAndView mView, @RequestParam String title) {
		String id=(String)request.getSession().getAttribute("id");
		int lastNum=dao.getLastNum(title);
		lastNum++;
		
		mView.addObject("title",title);
		mView.addObject("id",id);
		mView.addObject("lastNum",lastNum);
	}
}
