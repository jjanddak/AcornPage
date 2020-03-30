package com.gura.spring05;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.ToonComment.dao.ToonCommentDao;
import com.gura.spring05.toon.dto.ToonCommentDto;
import com.gura.spring05.toonlist.service.ToonListService;

/*
 *  @Controller 어노테이션
 *  - 해당 클래스가 Spring MVC  프로젝트에서 Controller 가 될수 있도록 한다.
 *  - component scan 을 통해서 spring bean container 에서 관리가 되는 
 *    bean 이 되어야 동작을 한다.  
 */
@Controller
public class HomeController {
	@Autowired
	ToonListService service;
 
	
	//글목록 요청처리
	@RequestMapping("/home")
	public ModelAndView list2(HttpServletRequest request){
		// HttpServletRequest 객체를 서비스에 넘겨 주면서
		// 비즈니스 로직을 수행하고 
		service.getToonList(request);
		// view page 로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("home");
		
	}
}













