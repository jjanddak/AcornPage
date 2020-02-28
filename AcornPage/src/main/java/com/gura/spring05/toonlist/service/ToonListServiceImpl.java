package com.gura.spring05.toonlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

		List<ToonListDto> list=dao.getDetailList(title);
		LibraryDto dto=new LibraryDto();
		String id="kapman";
		dto.setId(id);
		dto.setTitle(title);
		List<LibraryDto> libList=dao.checkLibrary(dto);
		
		for(int i=0; i<list.size(); i++) {
			
			if(libList.size()==0) {
				request.setAttribute("list", list);
				break;
			}
			for(int j=0; j<libList.size(); j++) {
				if(list.get(i).getCode().equals(libList.get(j).getCode())){
					list.get(i).setIsBuy(true);
					request.setAttribute("list", list);
				}
			}
		}
		
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


//	@Override
//	public List<LibraryDto> checkLibrary(HttpServletRequest request,String title,String id) {
//		LibraryDto dto=new LibraryDto();
//		dto.setId(id);
//		dto.setTitle(title);
//		List<LibraryDto> list=dao.checkLibrary(dto);
//		
//		//request.setAttribute("libList", list);
//		return list;
//		
//	}

	
}
