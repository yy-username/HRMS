package com.yy.entity;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Attendance implements Serializable{

	private int attendanceId; // 考勤ID
	private int userId; // 用户ID
	private Date inClockTime; // 上班打卡时间
	private int puchIn; // 上班打卡0未打卡 1已打卡
	private Date outClockTime; // 下班打卡时间
	private int punchOut; // 下班打卡 0未打卡 1已打卡
	private int absenteeism; // 旷工(请假按旷工处理)
	private Date createTime; //创建时间
	private int late; // 迟到
	private int leaveEarly; // 早退
	private Time officeHours; //上班时间
	private Time overOfficeHours; //下班时间
	private User user;
	

	public Attendance() {
		super();
	}

	public Attendance(int attendanceId, int userId, Date inClockTime, int puchIn, Date outClockTime, int punchOut,
			int absenteeism, Date createTime, int late, int leaveEarly, Time officeHours, Time overOfficeHours,
			User user) {
		super();
		this.attendanceId = attendanceId;
		this.userId = userId;
		this.inClockTime = inClockTime;
		this.puchIn = puchIn;
		this.outClockTime = outClockTime;
		this.punchOut = punchOut;
		this.absenteeism = absenteeism;
		this.createTime = createTime;
		this.late = late;
		this.leaveEarly = leaveEarly;
		this.officeHours = officeHours;
		this.overOfficeHours = overOfficeHours;
		this.user = user;
	}
	
	public int getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getInClockTime() {
		return MyUtil.returnTime(inClockTime);
	}

	public int getPuchIn() {
		return puchIn;
	}

	public void setPuchIn(int puchIn) {
		this.puchIn = puchIn;
	}

	public String getOutClockTime() {
		return MyUtil.returnTime(outClockTime);
	}

	public int getPunchOut() {
		return punchOut;
	}

	public void setPunchOut(int punchOut) {
		this.punchOut = punchOut;
	}

	public int getAbsenteeism() {
		return absenteeism;
	}

	public void setAbsenteeism(int absenteeism) {
		this.absenteeism = absenteeism;
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	
	
	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getLeaveEarly() {
		return leaveEarly;
	}

	public void setLeaveEarly(int leaveEarly) {
		this.leaveEarly = leaveEarly;
	}

	

	public void setInClockTime(Date inClockTime) {
		this.inClockTime = inClockTime;
	}

	public void setOutClockTime(Date outClockTime) {
		this.outClockTime = outClockTime;
	}

	/*public Date getOfficeHours() {
		return officeHours;
	}

	public void setOfficeHours(Date officeHours) {
		this.officeHours = officeHours;
	}

	public Date getOverOfficeHours() {
		return overOfficeHours;
	}

	public void setOverOfficeHours(Date overOfficeHours) {
		this.overOfficeHours = overOfficeHours;
	}
	*/
	

	public Time getOfficeHours() {
		return officeHours;
	}

	public void setOfficeHours(Time officeHours) {
		this.officeHours = officeHours;
	}

	public Time getOverOfficeHours() {
		return overOfficeHours;
	}

	public void setOverOfficeHours(Time overOfficeHours) {
		this.overOfficeHours = overOfficeHours;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*public int getWorkOvertime() {
		return workOvertime;
	}

	public void setWorkOvertime(int workOvertime) {
		this.workOvertime = workOvertime;
	}

	public int getWeekendOvertime() {
		return weekendOvertime;
	}

	public void setWeekendOvertime(int weekendOvertime) {
		this.weekendOvertime = weekendOvertime;
	}

	public int getHolidayOvertime() {
		return holidayOvertime;
	}

	public void setHolidayOvertime(int holidayOvertime) {
		this.holidayOvertime = holidayOvertime;
	}*/

}
