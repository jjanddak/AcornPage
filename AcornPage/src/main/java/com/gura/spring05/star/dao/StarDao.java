package com.gura.spring05.star.dao;

import java.util.List;

import com.gura.spring05.star.dto.StarDto;

public interface StarDao {
	public void insert(StarDto dto);
	public void update(StarDto dto);
}
