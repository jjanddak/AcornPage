package com.gura.spring05.toonlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.exception.NoMoneyException;
import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dao.ToonListDao;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dto.UsersDto;

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
		//전체 구매했을때 소장테이블에서 해당아이디와 만화에 대해 소장여부 체크
		LibraryDto dto=new LibraryDto();
		//String id=(String)request.getSession().getAttribute("id");
		String id="종혁";		
		dto.setId(id);
		dto.setTitle(title);
		List<ToonListDto> list=dao.getUnBuyList(dto);
		//전달받은 금액과 유저의 잔액을 비교하여 잔액이 더 많을경우 메소드 실행
		if(price < dao.getWallet(id)) {
			System.out.println(list.size());
			if(list.size()==0) {
				request.setAttribute("list", list);
				
			}
			for(int i=0; i<list.size(); i++) {
				list.get(i).setId(id);
				dao.insertCode(list.get(i));
				request.setAttribute("list", list);
			}
		//잔액이 더 적다면 커스텀익셉션 실행
		}else {
			throw new NoMoneyException("캐쉬가 부족합니다. 캐쉬충전페이지로 이동하시겠습니까?");
		}
		
		
	}


	@Override
	public void buyEach(HttpServletRequest request, List<String> eachCode) {
		System.out.println(eachCode.size());
		
		for(int i=0; i<eachCode.size(); i++) {
			LibraryDto dto=new LibraryDto();
			//String id=(String)request.getSession().getAttribute("id");
			String id="kapman";
			dto.setId(id);
			dto.setCode(eachCode.get(i));
			System.out.println(eachCode.get(i));
			dao.buyEach(dto);
		}
				
	}

	@Override
	public void getMyToon(String id, ModelAndView mView) {
		List<ToonDetailDto> myToon=dao.getMyToon(id);
		mView.addObject("myToon",myToon);
	}
	
}
