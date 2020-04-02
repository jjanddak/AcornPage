package com.gura.spring05.toonlist.dao;

import java.util.List;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dto.UsersDto;

public interface ToonListDao {
	public List<ToonDetailDto> getToonList(ToonDetailDto dto);
	
	public List<ToonDetailDto> getNovelList(ToonDetailDto dto);
	
	public List<ToonListDto> getDetailList(String title);
	//구매한 만화의 코드를 통해 글 정보 얻어오기
	public ToonListDto getCodeDetail(ToonListDto dto);
	//캐쉬 추가하기
	//차후에 아이디값이나 usersDto도 같이 전달받아 넘겨줘야됨
	public void cashUpdate(UsersDto dto);
	
	public void BuyCodeOne(LibraryDto dto);
	
	public LibraryDto BuyAll(LibraryDto dto);
		
	public int getWallet(String id);
	
	public List<LibraryDto> checkLibrary(LibraryDto dto);
	
	public List<ToonListDto> getUnBuyList(LibraryDto dto);
	
	public void buyEach(LibraryDto dto);
	
	public void insertCode(ToonListDto dto);
	
	public List<ToonDetailDto> getMyToon(String id);
	
	public void minusCash(UsersDto dto);
	
	public void plusCash(UsersDto dto);
	
	public String checkWriter(String code);
	
	public List<ToonDetailDto> getSelectedDetail(String category);
	
	public ToonDetailDto getDetailInfo(String title);

	public String haveNext(LibraryDto dto);
	
	public String havePrev(LibraryDto dto);
	
	public List<LibraryDto> getLibrary(String id);
	
	public String getTitle(String code);
	
	public ToonDetailDto getTitleDetail(String title);
	
	public void lastRead(UsersDto dto);
	
	public String getLastCode(String id);
	
	public void toonupdate(ToonListDto dto);

	public List<ToonListDto> getMyToonList(String id);
	
	public String checkCode(LibraryDto dto);
	
	public List<ToonListDto> permitDetail(String title);
	
	public ToonListDto permitCode(ToonListDto dto);
	
	public void permit_update(ToonListDto dto);
	
	public void permit_update_detail(ToonListDto dto);
	
	public List<ToonDetailDto> allDetailList();
	
	public List<ToonListDto> manageDetail(String title);
	
	public void deleteCode(String code);
	
	public List<ToonDetailDto> searchMyToon(String writer);
}
