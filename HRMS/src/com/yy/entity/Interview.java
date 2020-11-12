package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

public class Interview implements Serializable {

	private int interviewId; // 面试邀请ID
	private int resumeId; // 简历ID
	private int userId; //用户ID
	private int sendInterview; // 发送面试邀请(0未发送，1已发送)
	private String interviewContent; //面试邀请内容
	private Date sendTime; //发送面试邀请时间
	private int confirmInterview; // 确认面试(0 未确认 1 确认)
	private Date confirmTime; //确认面试时间
	private double writeScore; // 笔试评分
	private double interviewScore; // 面试评分
	private double totalScore; // 总分数
	private int interviewPass; // 面试是否通过(0 未通过 1 通过)
	private int employed; // 是否录用(0 未录用 1 录用)
	private int entry; //确认入职 0 未确认 1 确认
	private User user;
	private Resume resume;

	public Interview() {
		
	}

	public Interview(int interviewId, int resumeId, int sendInterview, String interviewContent, Date sendTime,
			int confirmInterview, Date confirmTime, double writeScore, double interviewScore, double totalScore,
			int interviewPass, int employed) {
		super();
		this.interviewId = interviewId;
		this.resumeId = resumeId;
		this.sendInterview = sendInterview;
		this.interviewContent = interviewContent;
		this.sendTime = sendTime;
		this.confirmInterview = confirmInterview;
		this.confirmTime = confirmTime;
		this.writeScore = writeScore;
		this.interviewScore = interviewScore;
		this.totalScore = totalScore;
		this.interviewPass = interviewPass;
		this.employed = employed;
	}

	public int getInterviewId() {
		return interviewId;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public int getSendInterview() {
		return sendInterview;
	}

	public void setSendInterview(int sendInterview) {
		this.sendInterview = sendInterview;
	}

	public int getConfirmInterview() {
		return confirmInterview;
	}

	public void setConfirmInterview(int confirmInterview) {
		this.confirmInterview = confirmInterview;
	}

	public double getWriteScore() {
		return writeScore;
	}

	public void setWriteScore(double writeScore) {
		this.writeScore = writeScore;
	}

	public double getInterviewScore() {
		return interviewScore;
	}

	public void setInterviewScore(double interviewScore) {
		this.interviewScore = interviewScore;
	}

	public double getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}

	public int getInterviewPass() {
		return interviewPass;
	}

	public void setInterviewPass(int interviewPass) {
		this.interviewPass = interviewPass;
	}

	public int getEmployed() {
		return employed;
	}

	public void setEmployed(int employed) {
		this.employed = employed;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}

	public String getInterviewContent() {
		return interviewContent;
	}

	public void setInterviewContent(String interviewContent) {
		this.interviewContent = interviewContent;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public int getEntry() {
		return entry;
	}

	public void setEntry(int entry) {
		this.entry = entry;
	}

}
