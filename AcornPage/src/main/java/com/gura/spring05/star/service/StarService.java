package com.gura.spring05.star.service;

import javax.servlet.http.HttpServletRequest;

public interface StarService {
	public void addStar(String code,int starValue,HttpServletRequest request);
}
