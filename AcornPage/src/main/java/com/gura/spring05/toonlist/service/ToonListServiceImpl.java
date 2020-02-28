package com.gura.spring05.toonlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dao.ToonListDao;
import com.gura.spring05.toonlist.dto.ToonListDto;

@Service
public class ToonListServiceImpl implements ToonListService{

	@Autowired
	private ToonListDao dao;

	@Override
	public void getToonList(HttpServletRequest request) {
		ToonDetailDto dto=new ToonDetailDto();
		
		List<ToonDetailDto> list=dao.getToonList(dto);
		
		request.setAttribute("list", list);

	}
	

	@Override
	public void getDetailList(HttpServletRequest request, String title) {
		ToonListDto dto=new ToonListDto();
		// startRowNum 과 endRowNum 에 해당하는 카페글 목록을 select 해 온다.
		List<ToonListDto> list=dao.getDetailList(title);
		//view 페이지에서 필요한 값을 request 에 담고 
		request.setAttribute("list", list);		
	}

	@Override
	public void getCodeDetail(HttpServletRequest request, String code) {
		ToonListDto dto=new ToonListDto();
		
		dto=dao.getCodeDetail(code);
		
		request.setAttribute("dto", dto);
	}

	@Override
	public boolean cashAdd(HttpServletRequest request, int cash) {
		//유저 아이디도 전달해줘야됨! 차후 수정
		boolean check=dao.cashUpdate(cash);
		if(check) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public void buyCodeOne(LibraryDto dto) {		
		dao.BuyCodeOne(dto);
	}


	@Override
	public void buyAll(HttpServletRequest request,String title, int price) {
		//String id=(String)request.getSession().getAttribute("id");
		String id="kapman";
		
		if(price < dao.getWallet(id)) {
			List<ToonListDto> list=dao.getSelectedList(title);
			for(int i=0; i<list.size(); i++) {
				list.get(i).setId(id);
				dao.insertCode(list.get(i));	
			}
		}
		
		
	}


	@Override
	public void checkLibrary(HttpServletRequest request,String title,String id) {
		LibraryDto dto=new LibraryDto();
		dto.setId(id);
		dto.setTitle(title);
		List<LibraryDto> list=dao.checkLibrary(dto);
		
		request.setAttribute("libList", list);
		
	}

	
}
