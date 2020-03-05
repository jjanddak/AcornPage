package com.gura.spring05.toonlist.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.star.dto.StarDto;
import com.gura.spring05.star.service.StarService;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gura.spring05.library.dto.LibraryDto;
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
		//리다일렉트 응답
		return new ModelAndView("redirect:detailCode.do?code="+loc);
		
	}
	
	@RequestMapping("/toon/userStarList")
	public ModelAndView authStarSearch(HttpServletRequest request, @RequestParam String id) {
		service.userStarList(request, id);
		
		return new ModelAndView("toon/userStarList");
	}
	
	//만화를 눌렀을때 전체 화가 나오는 리스트 로직
	@RequestMapping("/toon/selectedDetail")
	public ModelAndView detailList(HttpServletRequest request,@RequestParam String title){
		//타이틀로 해당 만화 목록을 가지고 오는 서비스 실행
		service.getDetailList(request,title);
		//타이틀로 해당 만화 정보를 가지고 오는 서비스 실행
		service.getDetailInfo(request, title);		
		// view page 로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("toon/selectedDetail");
	}
	//단일 만화의 회차를 눌렀을때 단일 만화의 정보를 가져오는 로직
	@RequestMapping("/toon/detailCode")
	public ModelAndView detailCodeView(HttpServletRequest request,@RequestParam String code) {
		service.getCodeDetail(request, code);
		starService.selectStarValueOneAVG(request, code);
		
		return new ModelAndView("toon/detailCode");
	}
	//캐쉬 충전팝업창 띄우기
	@RequestMapping("/cash/addcash")
	public ModelAndView moveCash(ModelAndView mView) {
		mView.setViewName("cash/addcash");
		return mView;
	}
	//캐쉬 충전하기 버튼을 눌렀을때 캐쉬충전하는 로직
	@RequestMapping("/cash/cashcharge")
	public ModelAndView chargeCash(HttpServletRequest request,@RequestParam int cash) {

		service.cashAdd(request,request.getSession(), cash);
		
		return new ModelAndView("cash/checkcash");
	}
	
	@RequestMapping("/toon/buyCodeOne")
	public ModelAndView authbuyCodeOne(HttpServletRequest request,@ModelAttribute LibraryDto dto,
			@RequestParam String code,@RequestParam String title) throws UnsupportedEncodingException {
		String param=URLEncoder.encode(title, "UTF-8");
		String id=(String)request.getSession().getAttribute("id");
		dto.setId(id);
		dto.setCode(code);
		service.buyCodeOne(dto);
		return new ModelAndView("redirect:/toon/selectedDetail.do?title="+param);
	}
	
	@RequestMapping("/toon/buyAll")
	public ModelAndView authbuyAll(HttpServletRequest request,@RequestParam String title,int price) throws UnsupportedEncodingException {
		service.buyAll(request,title,price);
		String param=URLEncoder.encode(title, "UTF-8");
		return new ModelAndView("redirect:/toon/selectedDetail.do?title="+param);
	}
	
	@ResponseBody
	@RequestMapping(value="/toon/buyEach", method=RequestMethod.POST)
	public Map<String, Object> authbuyEach(HttpServletRequest request,@RequestParam(value="arrEachCode[]")List<String> eachCode) {
		service.buyEach(request, eachCode);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	@RequestMapping("/toon/categorylist")
	public ModelAndView list(HttpServletRequest request,@RequestParam String category,ModelAndView mView) throws UnsupportedEncodingException {
		service.list(request, category);
		request.setAttribute("category", category);
		mView.setViewName("toon/categorylist");
		return mView;
	}
}	
