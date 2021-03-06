package com.gura.spring05.toonup.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.toonup.dto.NewToonupDto;
import com.gura.spring05.toonup.dto.ToonupDto;

public interface ToonupService {
	public void saveToon(ToonupDto dto);
	
	public void getLastNum(HttpServletRequest request,ModelAndView mView, @RequestParam String title);
	
	public void newToonupload(HttpServletRequest request, NewToonupDto dto);
	
	public void writerLibrary(ToonupDto dto);

	public void getLastCodeDetail(HttpServletRequest request, String title);

	public void toonUpdate(HttpServletRequest request, ToonListDto dto);
}
