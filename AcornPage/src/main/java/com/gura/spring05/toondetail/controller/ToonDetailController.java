package com.gura.spring05.toondetail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toondetail.servcie.ToonDetailService;

@Controller
public class ToonDetailController {

	@Autowired
	ToonDetailService service;
	

	  @RequestMapping(value = "/toon/searchedDetail"
				  ,method = RequestMethod.POST)
		  public ModelAndView getDetailList(
				  HttpServletRequest request){
	 
			  List<ToonDetailDto> detailList=service.getDetailList(request); 
			  request.setAttribute("detailList", detailList);
	  return new ModelAndView("/toon/searchedDetail");
	  }
	 
	//원글 삭제 요청 처리
	@RequestMapping("/toon/deletetoon")
	public ModelAndView DeleteToon(HttpServletRequest request,
				@ModelAttribute ToonDetailDto dto,@RequestParam String title){
		//서비스를 이용해서 글을 삭제하기 
		service.deleteToon(request, dto, title);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/users/info.do");
	}
	
}
