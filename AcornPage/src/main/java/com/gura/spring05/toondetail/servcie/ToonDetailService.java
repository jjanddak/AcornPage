package com.gura.spring05.toondetail.servcie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gura.spring05.toondetail.dto.ToonDetailDto;

public interface ToonDetailService {

	public List<ToonDetailDto> getDetailList(HttpServletRequest request);

	public void deleteToon(HttpServletRequest request, ToonDetailDto dto, String title);

	public void updateDetail(ToonDetailDto dto);

	public String thumbUpdate(HttpServletRequest request, MultipartFile mFile, String title);
	
}
