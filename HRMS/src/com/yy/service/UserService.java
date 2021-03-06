package com.yy.service;

import java.util.List;

import com.yy.entity.User;

public interface UserService {

	//添加用户(注册用)
	boolean addUser(User user);
	
	//添加员工
	boolean addEmployee(User user);
	
	//遍历All员工
	List<User> queryAllEmployee();
	
	//通过用户名查找用户(注册前用户名判断用)
	User queryUserByUserName(String nickName);
	
	//通过用户名和密码查找用户(所有用户登录通用)
	User queryUserByNameAndPwd(User user);
	
	//查找员工
	List<User> queryEmployee();
	
	//更新用户信息
	boolean updateUserByUser(User user);
	
	//根据部门ID查找用户
	List<User> queryUserByDeptId(int deptId);
	
	//根据职位ID查找员工
	List<User> queryUserByPositionId(int positionId);
	
	//员工登录（手机号和密码）
	User queryUserByMobileAndPwd(User user);
	
	//通过员工ID删除员工
	boolean deleteUserById(int userId);
	
	//通过用户ID查找用户
	User queryUserByUserId(int userId);
	
	//员工调岗用
	boolean updateEmployee(User user);
	
}
