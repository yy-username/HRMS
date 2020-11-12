package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Fine implements Serializable{

	private int fineId; // 奖惩ID
	private int userId; // 用户ID
	private int attendanceId; //考勤ID
	private double totalFine; // 奖惩总额
	private int leave; // 请假、旷工次数
	private double leaveMoney; //请假、旷工扣款
	private int lateLeaveEarly; // 迟到早退次数
	private double lateEarlyMoney; //迟到早退扣款
	private double bonus; //奖金
	private Date createTime; //创建时间
	private User user;
	private Attendance attendance;
	
	public Fine() {
		super();
	}
	public Fine(int fineId, int userId, int attendanceId, double totalFine, int leave, double leaveMoney,
			int lateLeaveEarly, double lateEarlyMoney, double bonus, Date createTime) {
		super();
		this.fineId = fineId;
		this.userId = userId;
		this.attendanceId = attendanceId;
		this.totalFine = totalFine;
		this.leave = leave;
		this.leaveMoney = leaveMoney;
		this.lateLeaveEarly = lateLeaveEarly;
		this.lateEarlyMoney = lateEarlyMoney;
		this.bonus = bonus;
		this.createTime = createTime;
	}
	public int getFineId() {
		return fineId;
	}
	public void setFineId(int fineId) {
		this.fineId = fineId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAttendanceId() {
		return attendanceId;
	}
	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
	}
	public double getTotalFine() {
		return totalFine;
	}
	public void setTotalFine(double totalFine) {
		this.totalFine = totalFine;
	}
	public int getLeave() {
		return leave;
	}
	public void setLeave(int leave) {
		this.leave = leave;
	}
	public double getLeaveMoney() {
		return leaveMoney;
	}
	public void setLeaveMoney(double leaveMoney) {
		this.leaveMoney = leaveMoney;
	}
	public int getLateLeaveEarly() {
		return lateLeaveEarly;
	}
	public void setLateLeaveEarly(int lateLeaveEarly) {
		this.lateLeaveEarly = lateLeaveEarly;
	}
	public double getLateEarlyMoney() {
		return lateEarlyMoney;
	}
	public void setLateEarlyMoney(double lateEarlyMoney) {
		this.lateEarlyMoney = lateEarlyMoney;
	}
	public double getBonus() {
		return bonus;
	}
	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}

	

}
