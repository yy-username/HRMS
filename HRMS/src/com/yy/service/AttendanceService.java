package com.yy.service;

import java.util.Date;
import java.util.List;

import com.yy.entity.Attendance;

public interface AttendanceService {

	//添加考勤记录
	boolean addAttendanceInfo(int userId);
	
	//修改考勤记录（上班打卡）
	boolean updateInAttendance(Attendance attendance);
	
	//修改考勤记录（下班打卡）
	boolean updateOutAttendance(Attendance attendance);
	
	//通过userID查询个人考勤记录
	List<Attendance> queryAttendance(int userId);
	
	//通过考勤ID查找
	Attendance queryByAttendanceId(int attendanceId);
	
	//通过时间段查找考勤，按照用户分组
	List<Attendance> queryByUserIdAndDate(int userId, Date startDate, Date endDate);
		
	//查找所有人的考勤记录
	List<Attendance> queryAllAttendance();
}
