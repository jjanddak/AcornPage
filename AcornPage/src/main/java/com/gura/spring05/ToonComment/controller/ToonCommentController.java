package com.gura.spring05.ToonComment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.ToonComment.service.ToonCommentService;
import com.gura.spring05.toon.dto.CommentLikeDto;
import com.gura.spring05.toon.dto.ToonCommentDto;

@Controller
public class ToonCommentController {
	@Autowired 
	private ToonCommentService service;
	
	//댓글 저장 요청 처리
	@RequestMapping(value = "/toon/comment_insert", 
			method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request,@RequestParam String title) throws UnsupportedEncodingException {
		service.saveComment(request);
		String code=URLEncoder.encode((String)request.getParameter("code"),"UTF-8"); 
		String param=URLEncoder.encode(title,"UTF-8");
		
		
		return new ModelAndView("redirect:/toon/detailCode.do?title="+param+"&code="+code);
	}
	//댓글 추천 처리
		@ResponseBody
		@RequestMapping(value = "/toon/commentlike", 
				method = RequestMethod.POST)
		public Map<String, Object> authAddLikeCount(HttpServletRequest request,@ModelAttribute("dto") CommentLikeDto dto,@RequestParam(value="arrEachCode[]")List<String> eachCode) {
			dto.setCode(eachCode.get(0));
			dto.setCommcode(eachCode.get(1));
			boolean checkLike=service.addLikeCount(request,dto);
			int count=(int)request.getAttribute("count");
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("checkLike",checkLike); 
			map.put("count", count);
			map.put("code",dto.getCommcode());
		 
			return map;
		}
}
