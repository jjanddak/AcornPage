package com.gura.spring05.toondetail.servcie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.toondetail.dao.ToonDetailDao;
import com.gura.spring05.toondetail.dto.ToonDetailDto;

@Service
public class ToonDetailServiceImp implements ToonDetailService{
	@Autowired
	ToonDetailDao dao;

	@Override
	public List<ToonDetailDto> getDetailList(HttpServletRequest request) {
		List<ToonDetailDto> detailList = null;
		String select=request.getParameter("select");
		String keyword=request.getParameter("keyword"); 
		
		if(select.equals("writer")) {
			detailList = dao.getWriterDetail(keyword);
		}else if(select.equals("title")) {
			detailList = dao.getTitleDetail(keyword);
		}else if(select.equals("hashtag")) {
			detailList = dao.getHashtagDetail(keyword);
		}
		return detailList;
	}

}
