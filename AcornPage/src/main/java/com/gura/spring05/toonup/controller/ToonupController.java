package com.gura.spring05.toonup.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.exception.NoMoneyException;
import com.gura.spring05.file.dto.FileDto;
import com.gura.spring05.toonlist.service.ToonListService;
import com.gura.spring05.toonup.dto.NewToonupDto;
import com.gura.spring05.toonup.dto.ToonupDto;
import com.gura.spring05.toonup.service.ToonupService;

@Controller
public class ToonupController {
	@Autowired 
	private ToonupService service;
	
	//툰리스트 업로드 폼
	@RequestMapping("/toon/toonup")
	public ModelAndView UploadForm(HttpServletRequest request, ModelAndView mView, @RequestParam String title) {
		service.getLastNum(request, mView, title);
		
		mView.setViewName("toon/toonup");
		
		return mView;
	}
	
	//툰리스트 디비에 반영(제출)
	@RequestMapping(value = "/toon/toonupload", method = RequestMethod.POST)
	public ModelAndView authUpload(HttpServletRequest request,
			@ModelAttribute ToonupDto dto) {
		//세션에 있는 글작성자의 아이디
		String writer=(String)
				request.getSession().getAttribute("id");
		//ToonupDto 객체에 담고 
		dto.setWriter(writer);
		//서비스를 이용해서 DB 에 저장
		service.saveToon(dto);
		service.writerLibrary(dto);
		
		return new ModelAndView("redirect:/users/info.do");
	}
	
	//툰디테일 신작 업로드 폼
	@RequestMapping("/toon/newToonup")
	public ModelAndView NewToonUploadForm(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");

			return new ModelAndView("toon/newToonup");		
	}
	
	//신작 업로드 요청 처리
	@RequestMapping(value = "/toon/newtoonupload", method = RequestMethod.POST)
	public ModelAndView authUpload(HttpServletRequest request,
			@ModelAttribute NewToonupDto dto) {
		
		service.newToonupload(request, dto);
		
		return new ModelAndView("redirect:/users/info.do");
	}

}
