package com.yy.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.AttendanceDao;
import com.yy.entity.Attendance;
import com.yy.service.AttendanceService;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao attendanceDao;
	
	/**
	 * 添加考勤记录
	 */
	@Override
	public boolean addAttendanceInfo(int userId) {
		if (userId == 0) {
			return false;
		}
		return attendanceDao.addAttendanceInfo(userId);
	}

	/**
	 * 修改考勤记录（下班打卡）
	 */
	@Override
	public boolean updateOutAttendance(Attendance attendance) {
		if (attendance == null) {
			return false;
		}
		return attendanceDao.updateOutAttendance(attendance);
	}

	/**
	 * 修改考勤记录（上班打卡）
	 */
	@Override
	public boolean updateInAttendance(Attendance attendance) {
		if (attendance == null) {
			return false;
		}
		return attendanceDao.updateInAttendance(attendance);
	}

	/**
	 * 通过ID查看个人考勤记录
	 */
	@Override
	public List<Attendance> queryAttendance(int userId) {
		if (userId == 0) {
			return null;
		}
		return attendanceDao.queryAttendance(userId);
	}

	/**
	 * 通过考勤ID查找
	 */
	@Override
	public Attendance queryByAttendanceId(int attendanceId) {
		if (attendanceId == 0) {
			return null;
		}
		return attendanceDao.queryByAttendanceId(attendanceId);
	}

	/**
	 * 通过时间段查找考勤
	 */
	@Override
	public List<Attendance> queryByUserIdAndDate(int userId, Date startDate, Date endDate) {
		if (userId == 0 || startDate == null || endDate == null) {
			return null;
		}
		return attendanceDao.queryByUserIdAndDate(userId, startDate, endDate);
	}

	@Override
	public List<Attendance> queryAllAttendance() {

		return attendanceDao.queryAllAttendance();
	}

	

}
