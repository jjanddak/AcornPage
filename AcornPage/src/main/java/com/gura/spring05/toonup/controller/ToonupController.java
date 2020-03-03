package com.gura.spring05.toonup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toonup.dto.ToonupDto;
import com.gura.spring05.toonup.service.ToonupService;

@Controller
public class ToonupController {
	@Autowired 
	private ToonupService service;
	
//	//파일 목록 보기 요청 처리 
//	@RequestMapping("/file/list")
//	public ModelAndView list(ModelAndView mView, 
//			HttpServletRequest request) {
//		//파일 목록과 페이징 처리에 필요한 값들을 request 에 담아주는 서비스 메소드 호출하기 
//		service.list(request);
//		
//		mView.setViewName("file/list");
//		return mView;
//	}
	//파일 업로드 폼 요청 처리
	@RequestMapping("/users/toonup")
	public ModelAndView UploadForm(HttpServletRequest request) {
		
		return new ModelAndView("users/toonup");
	}
	
	//파일 업로드 요청 처리
	@RequestMapping(value = "/users/toonupload", method = RequestMethod.POST)
	public ModelAndView authUpload(HttpServletRequest request,
			@ModelAttribute ToonupDto dto) {
		//세션에 있는 글작성자의 아이디
		String writer="백";
		//CafeDto 객체에 담고 
		dto.setWriter(writer);
		//서비스를 이용해서 DB 에 저장
		service.saveToon(dto);
		
		return new ModelAndView("redirect:../home.do");
	}
}
