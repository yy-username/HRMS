package com.yy.dao;

import com.yy.entity.User;

public interface UserDao {
	//ͨ���û�������������û�
	User queryUser(String userName, String password);
}
