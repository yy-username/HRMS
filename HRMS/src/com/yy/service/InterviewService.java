package com.yy.service;

import java.util.List;

import com.yy.entity.Interview;

public interface InterviewService {
	
	//添加面试邀请(管理员用)
	boolean addInterview(Interview interview);
	
	//确认参加面试
	boolean updateConfirmInterview(int interviewId);
	
	//面试打分
	boolean updateInterviewScore(Interview interview);
	
	//面试成绩通过修改状态
	boolean updateInterviewPass(int interviewId);
	
	//录用
	boolean updateEmployed(Interview interview);
	
	//入职
	boolean updateEntry(int interviewId);
	
	//查看面试评分
	Interview queryInterviewScore(Interview interview);
	
	//查看收到的所有面试邀请(游客用)
	List<Interview> queryInterviewInfo(int userId);
	
	//查看单条面试邀请(游客用)
	Interview queryInterviewSingleInfo(int interviewId);
	
	//遍历发送的所有面试邀请
	List<Interview> iteratorInterview();
}
