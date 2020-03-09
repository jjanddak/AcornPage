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
		// TODO Auto-generated method stub
		return session.selectList("toon.getToonList", dto);
	}

	@Override
	public List<ToonListDto> getDetailList(String title) {
		return session.selectList("toon.getDetailList", title);
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
	public List<ToonListDto> getUserStarList(ToonListDto dto) {
		return session.selectList("toon.getUserStarList", dto);
	}

	@Override
	public String havePrev(String code) {
		String num = code.replaceAll("[^0-9]","");
		code = code.replaceAll("[0-9]","");
		int tmp=Integer.parseInt(num);
		tmp--;
		code=code+tmp;
		
		return session.selectOne("toon.havePrev",code);
	}
	
	@Override
	public String haveNext(String code) {
		String num = code.replaceAll("[^0-9]","");
		code = code.replaceAll("[0-9]","");
		int tmp=Integer.parseInt(num);
		tmp++;
		code=code+tmp;
		
		return session.selectOne("toon.haveNext",code);
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

}
