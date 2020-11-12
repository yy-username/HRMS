package com.yy.service.impl;

import java.util.List;

import com.yy.dao.EmailDao;
import com.yy.dao.Impl.EmailDaoImpl;
import com.yy.entity.Email;
import com.yy.service.EmailService;

public class EmailServiceImpl implements EmailService {

	private EmailDao emailDao = new EmailDaoImpl();
	
	@Override
	public List<Email> queryMailList(String recipient) {
		return emailDao.queryMailList(recipient);
	}

}
