package com.gura.spring05.toondetail.servcie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring05.toondetail.dto.ToonDetailDto;

public interface ToonDetailService {

	public List<ToonDetailDto> getDetailList(HttpServletRequest request);

}
