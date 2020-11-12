package com.yy.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Attendance;
import com.yy.service.AttendanceService;
import com.yy.service.FineService;
import com.yy.utils.MyUtil;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private FineService fineService;
	
	/**
	 * 上班
	 * @param attendance
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/clockIn.action")
	public String clockIn(Attendance attendance, HttpSession session) {
//		Attendance attendance = null;
		Attendance attend = null;
		Date date = new Date();
		attendance.setInClockTime(date);
		Attendance att = attendanceService.queryByAttendanceId(attendance.getAttendanceId());
		if (date.getHours() > att.getOfficeHours().getHours()) {
			
			attendance.setLate(1);
			fineService.updateByLate(attendance.getAttendanceId());
	
		}else if (date.getHours() == att.getOfficeHours().getHours() && date.getHours() > att.getOfficeHours().getHours()) {
			attendance.setLate(1);
			fineService.updateByLate(attendance.getAttendanceId());
		}
//		attendance.setAttendanceId(attendanceId);
		
		if (attendanceService.updateInAttendance(attendance)) {
			attend = attendanceService.queryByAttendanceId(attendance.getAttendanceId());
			session.setAttribute("attend", attend);
		}
		return JSONObject.toJSONString(attend);
	}
	
	/**
	 * 下班
	 * @param attendance
	 * @param session
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("/clockOut.action")
	public String clockOut(Attendance attendance, HttpSession session) {
		Attendance attend = null;
		Date date = new Date();
		attendance.setOutClockTime(date);
		Attendance att = attendanceService.queryByAttendanceId(attendance.getAttendanceId());
		if (date.getHours() < att.getOverOfficeHours().getHours()) {
			attendance.setLeaveEarly(1);
			fineService.updateByEarly(attendance.getAttendanceId());
			
		}else if (date.getHours() == att.getOverOfficeHours().getHours() && date.getMinutes() < att.getOverOfficeHours().getMinutes()) {
			attendance.setLeaveEarly(1);
			fineService.updateByEarly(attendance.getAttendanceId());
		}
//		attendance.setAttendanceId(attendanceId);
		
		if (attendanceService.updateOutAttendance(attendance)) {
			attend = attendanceService.queryByAttendanceId(attendance.getAttendanceId());
			session.setAttribute("attenOut", attend);
		}
		return JSONObject.toJSONString(attend);
	}
	
	/**
	 * 考勤记录
	 * @param userId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkAttendanceRecord.action")
	public String checkAttendanceRecord(int userId, String startTime, String endTime) {
		Date startDate = MyUtil.setTime(startTime);
		Date endDate = MyUtil.setTime(endTime);
		List<Attendance> attendanceList = attendanceService.queryByUserIdAndDate(userId, startDate, endDate);
		return JSONObject.toJSONString(attendanceList);
	}
}
