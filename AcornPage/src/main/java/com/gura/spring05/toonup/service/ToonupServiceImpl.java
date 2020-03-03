package com.gura.spring05.toonup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
