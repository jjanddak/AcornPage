package com.gura.spring05.toonlist.dao;

import com.gura.spring05.toonlist.dto.StarPointDto;

public interface StarListDao {
	public void insert(StarPointDto dto);
	public void update(StarPointDto dto);
}
