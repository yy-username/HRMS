package com.yy.dao;

import java.util.List;

import com.yy.entity.Resume;

public interface ResumeDao {

	//添加简历
	boolean addResume(Resume resume);
	
	//通过用户ID查看个人简历（个人所有简历）
	List<Resume> queryResumeByUserId(int userId);
	
	//通过简历ID查看简历(查看单个简历)
	Resume queryResumeByResumeId(int resumeId);
	
	//查看所有人简历（管理员用）
	List<Resume> queryAllResume();
	
	//投递简历（修改投递状态和招聘信息ID）
	boolean modifyResume(Resume resume);
	
	//删除个人所有简历
	boolean deleteResume(int userId);
	
	//通过简历ID删除单条简历
	boolean deleteResumeByResumeId(int resumeId);
	
	//查看简历状态，判断是否投递
	int isdeliveryResume(int resumeId);
	
	//修改简历
	boolean updateResume(Resume resume);
	
	//通过简历ID和用户ID查找简历（管理员用）
	Resume queryResumeByResumeIdAndUserId(Resume resume);
}
