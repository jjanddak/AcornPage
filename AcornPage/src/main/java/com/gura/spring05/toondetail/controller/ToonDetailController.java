package com.gura.spring05.toondetail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toondetail.servcie.ToonDetailService;

@Controller
public class ToonDetailController {

	@Autowired
	ToonDetailService service;
	

	  @RequestMapping(value = "/toon/searchedDetail"
			  ,method = RequestMethod.GET)
	  public ModelAndView getDetailList(
			  HttpServletRequest request){
 
		  List<ToonDetailDto> detailList=service.getDetailList(request); 
		  request.setAttribute("detailList", detailList);
		  return new ModelAndView("/toon/searchedDetail");
	  }
	 

	
}
