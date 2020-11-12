package com.yy.dao;

import java.util.List;

import com.yy.entity.Fine;

public interface FineDao {

	//添加奖惩记录
	boolean addFine(int userId);
	
	//迟到
	boolean updateByLate(int attendanceId); 
	
	//早退
	boolean updateByEarly(int attendanceId);
	
	//查看所有的个人奖惩记录
	List<Fine> queryFine(int userId);
	
	//查看所有奖惩记录
	List<Fine> queryAllFine();
}
