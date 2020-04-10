package com.gura.spring05.toonlist.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.ToonComment.dao.ToonCommentDao;
import com.gura.spring05.exception.CanNotDeleteException;
import com.gura.spring05.exception.NoMoneyException;
import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toon.dto.CommentLikeDto;
import com.gura.spring05.toon.dto.ToonCommentDto;
import com.gura.spring05.toondetail.dao.ToonDetailDao;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dao.ToonListDao;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dto.UsersDto;

@Service
public class ToonListServiceImpl implements ToonListService{

	@Autowired
	private ToonListDao dao;
	@Autowired
	private ToonCommentDao commdao;
	@Autowired
	private ToonDetailDao detaildao;
	
	//한 페이지에 나타낼 row 의 갯수 
	static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=5;

	@Override
	public void getToonList(HttpServletRequest request) {
		ToonDetailDto dto=new ToonDetailDto();
		List<String> newList=dao.newDate();
		List<ToonDetailDto> toonList =dao.getToonList(dto);
		for(int i=0; i<toonList.size(); i++) {
			String title=toonList.get(i).getTitle();
			for(int j=0; j<newList.size(); j++) {
				if(newList.get(j).equals(title)) {
					toonList.get(i).setNewDate(true);
				}
			}
		}
		List<ToonDetailDto> novelList =dao.getNovelList(dto);
		for(int i=0; i<novelList.size(); i++) {
			String title=novelList.get(i).getTitle();
			for(int j=0; j<newList.size(); j++) {
				if(newList.get(j).equals(title)) {
					novelList.get(i).setNewDate(true);
				}
			}
		}
		request.setAttribute("toonList", toonList);
		request.setAttribute("novelList", novelList);

	}
	

	@Override
	public void getDetailList(HttpServletRequest request, String title) {

		
		String id=(String)request.getSession().getAttribute("id");
		if(id!=null) {
			List<ToonListDto> list=dao.getDetailList(title);
			LibraryDto dto=new LibraryDto();
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
		}else {
			List<ToonListDto> list=dao.getDetailList(title);
			request.setAttribute("list", list);
		}
		
	}

	@Override
	public void getCodeDetail(HttpServletRequest request, String title, String code) {
		ToonListDto dto=new ToonListDto();
		
		String updating=request.getParameter("updating");
		if(updating!=null) {
			dto.setUpdating(updating);
		}
		
		dto.setTitle(title);
		dto.setCode(code);
		String id=(String)request.getSession().getAttribute("id");
		dto.setId(id);
		LibraryDto libDto=new LibraryDto();
		LibraryDto libDto2=new LibraryDto();
		libDto.setId(id);	
		libDto.setTitle(title);
		libDto.setCode(code);
		libDto2.setId(id);	
		libDto2.setTitle(title);
		
		String checkCode=dao.checkCode(libDto);
		if(checkCode==null) {
			throw new NoMoneyException("알 수 없는 에러가 발생했습니다. 돈주고 보세요.");
		}else {
			dto=dao.getCodeDetail(dto);
		}
		
		
		
		
		UsersDto dto2=new UsersDto();
		dto2.setId(id);
		dto2.setLastread(code);
		dao.lastRead(dto2);
	      
		int num = dto.getNum();
		String nextnum=Integer.toString(num+1);
		String prevnum=Integer.toString(num-1);
		String prevcode=title+prevnum;
		String nextcode=title+nextnum;
		libDto.setCode(prevcode);
		libDto2.setCode(nextcode);
		
		String havePrev=dao.havePrev(libDto);
		String haveNext=dao.haveNext(libDto2);		

		request.setAttribute("num", num);
		request.setAttribute("havePrev", havePrev);
		request.setAttribute("haveNext", haveNext);
		request.setAttribute("dto", dto);
	}

	@Override
	public void cashAdd(HttpServletRequest request,HttpSession session,int cash) {
		String id=(String)request.getSession().getAttribute("id");
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setWallet(cash);
		dao.cashUpdate(dto);
		int wallet=dao.getWallet(id);
		session.setAttribute("wallet", wallet);
	}


	@Override
	public void buyCodeOne(LibraryDto dto,HttpServletRequest request) {
		String id=dto.getId();
		int price=100;
		if(price < dao.getWallet(id)) {
			//소장코드를 테이블에 넣어주고
			dao.BuyCodeOne(dto);
			String writer=dao.checkWriter(dto.getCode());
			
			//구매자 아이디와 가격을 통해 캐쉬차감
			UsersDto dto2=new UsersDto();
			dto2.setId(id);
			dto2.setPrice(price);
			dao.minusCash(dto2);
			int wallet=dao.getWallet(id);
			request.getSession().setAttribute("wallet", wallet);
			//판매자에게 캐쉬증가
			dto2.setId(writer);
			dto2.setPrice(price/2);
			dao.plusCash(dto2);
		}else {
			throw new NoMoneyException("캐쉬가 부족합니다. 캐쉬충전페이지로 이동하시겠습니까?");
		}
	}


	@Override
	public void buyAll(HttpServletRequest request,String title, int price) {
		//전체 구매했을때 소장테이블에서 해당아이디와 만화에 대해 소장여부 체크
		LibraryDto dto=new LibraryDto();
		String id=(String)request.getSession().getAttribute("id");
		dto.setId(id);
		dto.setTitle(title);
		List<ToonListDto> list=dao.getUnBuyList(dto);
		//작가 아이디 얻어오기
		String writer=list.get(0).getWriter();
		//전달받은 금액과 유저의 잔액을 비교하여 잔액이 더 많을경우 메소드 실행
		if(price < dao.getWallet(id)) {
			UsersDto dto2=new UsersDto();
			dto2.setId(id);
			dto2.setPrice(price);
			dao.minusCash(dto2);
			int wallet=dao.getWallet(id);
			request.getSession().setAttribute("wallet", wallet);
			//판매자에게 캐쉬증가
			dto2.setId(writer);
			dto2.setPrice(price/2);
			dao.plusCash(dto2);
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
		//로그인된 세션의 아이디를 가지고 오고
		String id=(String)request.getSession().getAttribute("id");
		String writer=dao.checkWriter(eachCode.get(0));
		//list의 사이즈 X 가격으로 총 결제금액을 만든뒤
		int price=eachCode.size()*100;
		//price 와 유저의 잔액을 비교하여 잔액이 더 많을경우 메소드 실행
		if(price < dao.getWallet(id)) {
			//id와 금액을 UsersDto에 담아 캐쉬차감 메소드 실행
			UsersDto dto2=new UsersDto();
			dto2.setId(id);
			dto2.setPrice(price);
			dao.minusCash(dto2);
			int wallet=dao.getWallet(id);
			request.getSession().setAttribute("wallet", wallet);
			//판매자에게 캐쉬증가
			dto2.setId(writer);
			dto2.setPrice(price/2);
			dao.plusCash(dto2);
			//전달받은 list의 크기만큼 소장테이블에 insert문을 실행한다.
			for(int i=0; i<eachCode.size(); i++) {
				LibraryDto dto=new LibraryDto();
				dto.setId(id);
				dto.setCode(eachCode.get(i));
				dao.buyEach(dto);
			}
		}else {
			throw new NoMoneyException("캐쉬가 부족합니다. 캐쉬충전페이지로 이동하시겠습니까?");
		}
	}

	@Override
	public void list(HttpServletRequest request, String category) {
		List<ToonDetailDto> list=dao.getSelectedDetail(category);
		request.setAttribute("list", list);
		
	}


	@Override
	public void getDetailInfo(HttpServletRequest request, String title) {
		ToonDetailDto dto=dao.getDetailInfo(title);
		request.setAttribute("dto", dto);
	}

	@Override
	public void getMyToon(String id, ModelAndView mView) {
		List<ToonDetailDto> myToon=dao.getMyToon(id);
		mView.addObject("myToon",myToon);
	}



	@Override
	public void getToonCommentList(HttpServletRequest request,String code) {
//		String code=(String)request.getParameter("code");		
		String id=(String)request.getSession().getAttribute("id");
		ToonCommentDto dto=new ToonCommentDto();
		CommentLikeDto likedto=new CommentLikeDto();
		dto.setCode(code);
		dto.setId(id);
		
		likedto.setCode(code);
		likedto.setId(id);
		//페이징처리
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=commdao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		// startRowNum 과 endRowNum 을 CafeDto 객체에 담고 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ToonCommentDto> toonCommentList=commdao.getList(dto);
		List<CommentLikeDto> likeList=commdao.likeList(likedto);
		
		for(int i=0; i<toonCommentList.size(); i++) {
			for(int j=0; j<likeList.size(); j++) {
				if(toonCommentList.get(i).getCommcode().equals(likeList.get(j).getCommcode())) {
					toonCommentList.get(i).setIsLike(true);
					break;
				}
			}
		}
		
		request.setAttribute("toonCommentList", toonCommentList);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		//전체 글의 갯수도 request 에 담는다.
		request.setAttribute("totalRow", totalRow);			
		
	}
	@Override
	public void buyList(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		List<LibraryDto> code=dao.getLibrary(id);
		List<String> titles=new ArrayList<String>();
		for(int i=0; i<code.size(); i++) {
			
			String title=dao.getTitle(code.get(i).getCode());
			titles.add(title);
		}
		HashSet<String> hash=new HashSet<String>(titles);
		List<String> hashTitle=new ArrayList<String>(hash);
		List<ToonDetailDto> list=new ArrayList<ToonDetailDto>();
		for(int i=0; i<hashTitle.size(); i++) {
			ToonDetailDto dto=dao.getTitleDetail(hashTitle.get(i));
			list.add(dto);
		}	
		request.setAttribute("list", list);
	}


	@Override
	public ToonListDto getLastRead(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String lastCode=dao.getLastCode(id);
		String title=dao.getTitle(lastCode);

		ToonListDto dto=new ToonListDto();
		dto.setCode(lastCode);
		dto.setTitle(title);
		return dto;
	}


	@Override
	public void getMyToonList(String id, HttpServletRequest request) {
		List<ToonListDto> myToonList=dao.getMyToonList(id);
		request.setAttribute("myToonList", myToonList);		
	}
	
	@Override
	public void deleteList(HttpServletRequest request,String code) {
		String id=(String)request.getSession().getAttribute("id");
		String title=code.replaceAll("[0-9]","");
		ToonDetailDto dto=new ToonDetailDto();
		dto.setTitle(title);
		dto.setWriter(id);
		int num = Integer.parseInt(code.replaceAll("[^0-9]","")); 
		if(id.equals(dao.checkWriter(code))) {
			if(num==1) {
				detaildao.deleteToon(dto);
				dao.deleteList(code);
			}
			dao.deleteList(code);			
		}else {
			throw new CanNotDeleteException();
		}
	}


	@Override
	public void updateList(ToonListDto dto) {
		dao.updateList(dto);
	}
	
	@Override
	public void searchMyToon(HttpServletRequest request) {
		String writer=(String)request.getSession().getAttribute("id");
		List<ToonDetailDto> list=dao.searchMyToon(writer);
		request.setAttribute("detailList", list);
	}
}
