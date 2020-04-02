package com.gura.spring05.star.service;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.star.dto.StarDto;

public interface StarService {
	public void addStar(StarDto dto);
	public void selectStarValueOneAVG(HttpServletRequest request, String code);
	public void checkMyStar(HttpServletRequest request,String code);
}
