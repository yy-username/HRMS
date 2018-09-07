package com.yy.service;

import com.yy.entity.User;

public interface UserService {
	User queryUser(String userName, String password);
}
