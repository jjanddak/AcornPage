package com.gura.spring05.star.dao;

import com.gura.spring05.star.dto.StarDto;

public interface StarDao {
	public String select(StarDto dto);
	public void insert(StarDto dto);
	public void update(StarDto dto);
	public StarDto selectStarOneAVG(StarDto dto);
	public Object checkMyStar(StarDto dto);
}
