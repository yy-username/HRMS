package com.yy.dao;

import com.yy.entity.User;

public interface UserDao {
	
	
	/**
	 * 注释
	 * @param userName
	 * @param password
	 * @return
	 */
	//ͨ���û�������������û�
	User queryUser(String userName, String password);
}
