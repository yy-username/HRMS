package com.yy.dao;

import com.yy.entity.User;

public interface UserDao {
	//通过用户名和密码查找用户
	User queryUser(String userName, String password);
}
