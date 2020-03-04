package com.gura.spring05.toonlist.dao;

import java.util.List;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dto.UsersDto;

public interface ToonListDao {
	//차후 별점 이너조인 해서 5개 목록으로 가져와야됨 ㅇㅋ?
	public List<ToonDetailDto> getToonList(ToonDetailDto dto);
	
	public List<ToonListDto> getDetailList(String title);
	//구매한 만화의 코드를 통해 글 정보 얻어오기
	public ToonListDto getCodeDetail(String code);
	//캐쉬 추가하기
	//차후에 아이디값이나 usersDto도 같이 전달받아 넘겨줘야됨
	public void cashUpdate(int cash);
	
	public void BuyCodeOne(LibraryDto dto);
	
	public LibraryDto BuyAll(LibraryDto dto);
		
	public int getWallet(String id);
	
	public void insertCode(ToonListDto dto);
	
	public List<LibraryDto> checkLibrary(LibraryDto dto);
	
	public List<ToonListDto> getUnBuyList(LibraryDto dto);
	
	public void buyEach(LibraryDto dto);
	
	public void minusCash(UsersDto dto);
	
	public List<ToonListDto> getUserStarList(ToonListDto dto);
}
