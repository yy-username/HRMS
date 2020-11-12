package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.FineDao;
import com.yy.entity.Fine;
import com.yy.service.FineService;

@Service
public class FineServiceImpl implements FineService {

	@Autowired
	private FineDao fineDao;
	
	//添加奖惩记录
	@Override
	public boolean addFine(int userId) {

		if (userId == 0) {
			return false;
		}
		return fineDao.addFine(userId);
	}

	//查看所有的个人奖惩记录
	@Override
	public List<Fine> queryFine(int userId) {

		if (userId == 0) {
			return null;
		}
		return fineDao.queryFine(userId);
	}

	/**
	 * 迟到
	 */
	@Override
	public boolean updateByLate(int attendanceId) {

		if (attendanceId == 0) {
			return false;
		}
		return fineDao.updateByLate(attendanceId);
	}

	/**
	 * 早退
	 */
	@Override
	public boolean updateByEarly(int attendanceId) {

		if (attendanceId == 0) {
			return false;
		}
		return fineDao.updateByEarly(attendanceId);
	}

	@Override
	public List<Fine> queryAllFine() {

		return fineDao.queryAllFine();
	}

}
