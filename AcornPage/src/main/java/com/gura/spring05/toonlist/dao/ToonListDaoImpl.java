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
	public ToonListDto getCodeDetail(String code) {
		
		return session.selectOne("toon.getCodeDetail", code);
	}

	@Override
	public boolean cashUpdate(int cash) {

		session.update("toon.cashUpdate",cash);
		
		return true;
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
		System.out.println(dto.getCode()+dto.getId());
		session.insert("toon.buyEach",dto);
		
	}
	
}
