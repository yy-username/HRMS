package com.yy.service.impl;

import com.yy.dao.UserDao;
import com.yy.dao.Impl.UserDaoImpl;
import com.yy.entity.User;
import com.yy.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao = new UserDaoImpl();

	@Override
	public User queryUser(String userName, String password) {
		return userDao.queryUser(userName, password);
	}

}
