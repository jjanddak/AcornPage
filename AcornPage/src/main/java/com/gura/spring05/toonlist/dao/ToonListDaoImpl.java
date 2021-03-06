package com.gura.spring05.toonlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dto.UsersDto;
@Repository
public class ToonListDaoImpl implements ToonListDao{
	
	@Autowired
	private SqlSession session;
	@Override
	public List<ToonDetailDto> getToonList(ToonDetailDto dto) {
		return session.selectList("toon.getToonList", dto);
	}
	
	public List<ToonDetailDto> getNovelList(ToonDetailDto dto) {
		return session.selectList("toon.getNovelList", dto);
	}
	
	@Override
	public List<ToonListDto> getDetailList(String title) {
		List<ToonListDto> list=session.selectList("toon.getDetailList", title);
		if(list.size()==0) {
			return null;
		}else {
			return list;
		}
	}

	@Override
	public ToonListDto getCodeDetail(ToonListDto dto) {
		
		return session.selectOne("toon.getCodeDetail", dto);
	}

	@Override
	public void cashUpdate(UsersDto dto) {

		session.update("toon.cashUpdate",dto);
		
	}

	@Override
	public void BuyCodeOne(LibraryDto dto) {
		
		session.insert("toon.buyCodeOne",dto);
		
	}

	@Override
	public LibraryDto BuyAll(LibraryDto dto) {
		return session.selectOne("toon.checkCode", dto);
		
	}

	@Override
	public int getWallet(String id) {
		
		return session.selectOne("toon.getWallet",id);
	}

	@Override
	public void insertCode(ToonListDto dto) {
		
		session.insert("toon.insertCode",dto);
	}

	@Override
	public List<LibraryDto> checkLibrary(LibraryDto dto) {

		return session.selectList("toon.checkLibrary",dto);
	}

	@Override
	public List<ToonListDto> getUnBuyList(LibraryDto dto) {
		
		return session.selectList("toon.getUnBuyList",dto);
	}

	@Override
	public void buyEach(LibraryDto dto) {

		session.insert("toon.buyEach",dto);
		
	}

	@Override
	public List<ToonDetailDto> getMyToon(String id) {
		return session.selectList("toon.getMyToon",id);
	}
	public void minusCash(UsersDto dto) {
		
		session.update("toon.minusCash",dto);
	}

	@Override
	public void plusCash(UsersDto dto) {
		
		session.update("toon.plusCash",dto);
	}

	@Override
	public String checkWriter(String code) {
		
		return session.selectOne("toon.checkWriter", code);
	}

	@Override
	public List<ToonDetailDto> getSelectedDetail(String category) {
		if(category.equals("toon") || category.equals("novel")) {
			return session.selectList("toon.selectedToonovel",category);
		}else {
			return session.selectList("toon.selectedHashtag",category);
		}
		
	}

	@Override
	public ToonDetailDto getDetailInfo(String title) {
		
		return session.selectOne("toon.getDetailInfo", title);
	}

	@Override
	public String havePrev(LibraryDto dto) {
		
		return session.selectOne("toon.havePrev",dto);
	}
	
	@Override
	public String haveNext(LibraryDto dto) {
			
		return session.selectOne("toon.haveNext",dto);
	}


	public List<LibraryDto> getLibrary(String id) {
		
		return session.selectList("toon.getLibrary",id);
	}

	@Override
	public String getTitle(String code) {
		
		return session.selectOne("toon.getTitle",code);
	}

	@Override
	public ToonDetailDto getTitleDetail(String title) {
		
		return session.selectOne("toon.getTitleDetail",title);
	}

	@Override
	public void lastRead(UsersDto dto) {
		
		session.update("toon.lastRead",dto);
		
	}

	@Override
	public String getLastCode(String id) {
		
		return session.selectOne("toon.getLastCode",id);
	}

	@Override
	public void toonupdate(ToonListDto dto) {
		session.update("toon.toonListUpdate",dto);
		session.update("toon.toonDetailUpdate",dto);
	}

	@Override
	public List<ToonListDto> getMyToonList(String id) {
		return session.selectList("toon.getMyToonList",id);
	}
	
	@Override
	public String checkCode(LibraryDto dto) {
		return session.selectOne("toon.checkCode",dto);
	}

	@Override
	public List<ToonListDto> permitDetail(String title) {
		
		return session.selectList("toon.permitDetail",title);
	}
	
	@Override
	public ToonListDto permitCode(ToonListDto dto) {
		
		return session.selectOne("toon.permitCode",dto);
	}
	@Override
	public void permit_update(ToonListDto dto) {
		
		session.update("toon.permit_update",dto);
	}
	@Override
	public void permit_update_detail(ToonListDto dto) {
		
		session.update("toon.permit_update_detail",dto);
	}
	@Override
	public List<ToonDetailDto> allDetailList() {
		
		return session.selectList("toon.allDetailList");
	}

	@Override
	public void deleteList(String code) {
		session.delete("toon.deleteCode",code);
	}

	@Override
	public void updateList(ToonListDto dto) {
		session.update("toon.updateList",dto);
	}
	
	@Override
	public List<ToonListDto> manageDetail(String title) {
		
		return session.selectList("toon.manageDetail",title);
	}
	@Override
	public void deleteCode(String code) {

		session.delete("toon.deleteCode",code);
	}
	@Override
	public List<ToonDetailDto> searchMyToon(String writer) {
		
		return session.selectList("toon.searchMyToon",writer);
	}
	@Override
	public List<String> newDate() {
		return session.selectList("toon.newDate");
	}
	@Override
	public List<String> morePermit(String title) {
		return session.selectList("toon.morePermit",title);
	}
}
