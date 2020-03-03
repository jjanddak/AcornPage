package com.gura.spring05.toonlist.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.star.dto.StarDto;
import com.gura.spring05.star.service.StarService;
import com.gura.spring05.toonlist.service.ToonListService;

@Controller
public class ToonListController {
	@Autowired
	private ToonListService service;
	@Autowired
	private StarService starService;
	
	@RequestMapping("/toon/starAdd")
	public ModelAndView authAddStar(HttpServletRequest request, @ModelAttribute StarDto dto, 
			@RequestParam String code, @RequestParam int starValue) {
		String id = (String) request.getSession().getAttribute("id");
		dto.setCode(code);
		dto.setStarValue(starValue);
		dto.setId(id);
		starService.addStar(dto);
		String loc=code;

		return new ModelAndView("redirect:detailCode.do?code="+loc);
		//리다일렉트 응답
	}
//	@RequestMapping("/toon/buyCodeOne")
//	public ModelAndView buyCode(HttpServletRequest request,@ModelAttribute LibraryDto dto,@RequestParam String code) {
//		//String id=(String)request.getSession().getAttribute("id");
//		String id="kapman";
//		dto.setId(id);
//		//dto.setCode((String)request.getAttribute("code"));
//		dto.setCode(code);
//		service.buyCodeOne(dto);
//		return new ModelAndView("redirect:/home.do");
//	}
	//만화를 눌렀을때 전체 화가 나오는 리스트 로직
	@RequestMapping("/toon/selectedDetail")
	public ModelAndView detailList(HttpServletRequest request,@RequestParam String title){
		// HttpServletRequest 객체를 서비스에 넘겨 주면서
		// 비즈니스 로직을 수행하고 
		service.getDetailList(request,title);
		
		// view page 로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("toon/selectedDetail");
	}
	//단일 만화의 회차를 눌렀을때 단일 만화의 정보를 가져오는 로직
	@RequestMapping("/toon/detailCode")
	public ModelAndView detailCodeView(HttpServletRequest request,@RequestParam String code) {
		service.getCodeDetail(request, code);
		
		return new ModelAndView("toon/detailCode");
	}
	
	@RequestMapping("/cash/addcash")
	public ModelAndView moveCash(ModelAndView mView) {
		mView.setViewName("cash/addcash");
		return mView;
	}
	
	@RequestMapping("/cash/cashcharge")
	public ModelAndView chargeCash(HttpServletRequest request,@RequestParam int cash,ModelAndView mView) {
		//세션에 아이디를 리퀘스트에 담아 넘겨줘야되는 부분. 차후 수정!
		//String id=(String)request.getSession().getAttribute("id");
		//@RequestParam String id로 id값 넘겨준다.
		if(service.cashAdd(request, cash)) {
			boolean isSuccess=true;
			mView.addObject("isSuccess",isSuccess);
		}else {
			boolean isSuccess=false;
			mView.addObject("isSuccess",isSuccess);
		}
		mView.setViewName("cash/checkcash");
		
		return mView;
	}
}
