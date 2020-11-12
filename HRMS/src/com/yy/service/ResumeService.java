package com.yy.service;

import java.util.List;

import com.yy.entity.Resume;
import com.yy.entity.User;

public interface ResumeService {

	//添加简历
	boolean addResume(Resume resume, User user);
	
	//通过用户ID查看个人简历（个人所有简历）
	List<Resume> queryResumeByUserId(int userId);
	
	//通过简历ID查看简历(查看单个简历)
	Resume queryResumeByResumeId(int resumeId);
	
	//查看所有人简历（管理员用）
	List<Resume> queryAllResume();
	
	//修改简历(投递简历用)
	boolean modifyResume(Resume resume);
	
	//删除个人所有简历
	boolean deleteResumeByUserId(int userId);
	
	//通过简历ID删除单条简历
	boolean deleteResumeByResumeId(int resumeId);
	
	//查看简历状态，判断是否投递
	int isdeliveryResume(int resumeId);
	
	//修改简历
	boolean updateResume(Resume resume);
	
	//通过简历ID和用户ID查找简历（管理员用）
	Resume queryResumeByResumeIdAndUserId(Resume resume);
}
