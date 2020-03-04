package com.gura.spring05.toonup.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonup.dto.ToonupDto;

public interface ToonupDao {
	public void insert(ToonupDto dto);
	
	public int getLastNum(String title);
}
