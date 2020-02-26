package com.gura.spring05.toonlist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.toonlist.dao.StarListDao;
import com.gura.spring05.toonlist.dto.StarPointDto;


@Service
public class StarListServiceImpl implements StarListService{
	
	@Autowired
	private StarListDao dao;

	@Override
	public void addStar(StarPointDto dto) {
		dao.insert(dto);
	}
}
