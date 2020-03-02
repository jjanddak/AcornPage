package com.gura.spring05.toonup.service;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.toonup.dto.ToonupDto;

public interface ToonupService {
	public void saveToon(HttpServletRequest request,ToonupDto dto);
}
