package com.gura.spring05.star.dao;

import com.gura.spring05.star.dto.StarDto;

public interface StarDao {
	public String select(String id);
	public void insert(StarDto dto);
	public void update(StarDto dto);
}
