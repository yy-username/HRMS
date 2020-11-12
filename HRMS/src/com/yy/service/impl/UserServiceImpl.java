package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.UserDao;
import com.yy.entity.User;
import com.yy.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 添加用户
	 * @param User 传入需要添加的用户User
	 * @return User 返回User对象
	 */
	@Override
	public boolean addUser(User user) {

		if (userDao.queryUserByUserName(user.getNickName()) == null) {
			return userDao.addUser(user);
		}
		return false;
	}

	/**
	 * 用过用户名和密码查找用户(用户登录通用)
	 * @param String 传入用户名和密码
	 * @return 返回User对象
	 */
	@Override
	public User queryUserByNameAndPwd(User user) {
		
		return userDao.queryUserByNameAndPwd(user);
	}

	/**
	 * 用过用户名和密码查找用户(管理员登录用)
	 * @param String 传入用户名和密码
	 * @return 返回User对象
	 */
	/*@Override
	public User queryAdmin(User user) {
		
		return userDao.queryAdmin(user);
	}*/
	
	/**
	 * 更新用户信息
	 * @param User 传入User对象
	 * @return User 返回User对象
	 */
	@Override
	public boolean updateUserByUser(User user) {
		
		return userDao.updateUserByUser(user);
	}

	/**
	 * 通过昵称查询用户
	 * @param String 用户昵称
	 * @return User 返回user对象
	 */
	@Override
	public User queryUserByUserName(String nickName) {
		
		return userDao.queryUserByUserName(nickName);
	}

	/**
	 * 遍历输出所有员工
	 */
	@Override
	public List<User> queryEmployee() {

		List<User> employeeList = userDao.queryEmployee();
		
		return employeeList;
	}

	@Override
	public List<User> queryUserByDeptId(int deptId) {

		return userDao.queryUserByDeptId(deptId);
	}

	@Override
	public List<User> queryUserByPositionId(int positionId) {

		return userDao.queryUserByPositionId(positionId);
	}

	/**
	 * 员工通过手机号和密码登录
	 */
	@Override
	public User queryUserByMobileAndPwd(User user) {

		return userDao.queryUserByMobileAndPwd(user);
	}

	/**
	 * 添加员工
	 */
	@Override
	public boolean addEmployee(User user) {

		
		return userDao.addEmployee(user);
	}

	@Override
	public boolean deleteUserById(int userId) {

		return userDao.deleteUserById(userId);
	}

	/**
	 * 通过用户ID查找用户
	 */
	@Override
	public User queryUserByUserId(int userId) {
		if (userId != 0) {
			return userDao.queryUserByUserId(userId);
		}
		return null;
	}

	/**
	 * 员工调岗用
	 */
	@Override
	public boolean updateEmployee(User user) {
		if (user != null) {
			return userDao.updateEmployee(user);
		}
		return false;
	}

	/**
	 * 查找所有员工
	 */
	@Override
	public List<User> queryAllEmployee() {

		return userDao.queryAllEmployee();
	}

	
}
