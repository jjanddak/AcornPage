package com.gura.spring05.cafe.dao;

import java.util.List;

import com.gura.spring05.cafe.dto.CafeDto;
import com.gura.spring05.info.dto.InfoDto;
import com.gura.spring05.toon.dto.ToonDto;

public interface CafeDao {
	//글의 갯수 
	public int getCount(CafeDto dto);
	//글의 목록
	public List<CafeDto> getList(CafeDto dto);
	//글 추가 
	public void insert(CafeDto dto);
	//글 정보 얻어오기 
	public CafeDto getData(CafeDto dto);
	//조회수 증가 시키기 
	public void addViewCount(int num);
	//글 삭제 
	public void delete(int num);
	//글 하나의 정보 
	public CafeDto getData(int num);
	//글 수정 
	public void update(CafeDto dto);
	public List<InfoDto> getList2(InfoDto dto);
	public List<ToonDto> getList3(String title);
	//구매한 만화의 코드를 통해 글 정보 얻어오기
	public ToonDto getCodeData(String code);
	//캐쉬 추가하기
	//차후에 아이디값이나 usersDto도 같이 전달받아 넘겨줘야됨
	public boolean cashUpdate(int cash);
}
