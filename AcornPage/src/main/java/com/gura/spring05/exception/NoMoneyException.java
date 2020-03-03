package com.gura.spring05.exception;

import org.springframework.dao.DataAccessException;

public class NoMoneyException extends DataAccessException{

	public NoMoneyException(String msg) {
		super(msg);
		
	}
	
}
