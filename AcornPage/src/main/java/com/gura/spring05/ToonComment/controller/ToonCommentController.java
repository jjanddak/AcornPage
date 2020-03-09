package com.gura.spring05.ToonComment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.ToonComment.service.ToonCommentService;

@Controller
public class ToonCommentController {
	@Autowired 
	private ToonCommentService service;
	
	//댓글 저장 요청 처리
	@RequestMapping(value = "toon/comment_insert", 
			method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request) {
		service.saveComment(request);
		String code=(String)request.getParameter("code");
		String title=(String)request.getParameter("title");
		
		return new ModelAndView("redirect:/toon/detailCode.do?title="+title+"&code="+code);
	}
	//댓글 추천 처리
	@RequestMapping(value = "toon/commentlike", 
			method = RequestMethod.GET)
	public ModelAndView authAddLikeCount(HttpServletRequest request) {	
		service.addLikeCount(request);
		String code=(String)request.getParameter("code");
		String title=(String)request.getParameter("title");
		return new ModelAndView("redirect:/toon/detailCode.do?title="+title+"&code="+code);
	}
	
}
