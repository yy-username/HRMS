package com.yy.service;

import java.util.List;

import com.yy.entity.Recruitment;

public interface RecruitmentService {

	//添加招聘信息(管理员发布用)
	boolean addRecruitmentInfo(Recruitment recruitment);
	
	//查看所有的招聘信息(管理员游客均可用)
	List<Recruitment> queryAllRecruitmentInfo();
	
	//通过招聘ID查看单条招聘信息(管理员游客均可用)
	Recruitment queryRecruitmentInfoByRecruitmentId(int RecruitmentId);
	
	//发布招聘信息(管理员用)
	boolean updateByRecruitmentId(int RecruitmentId);
	
	//通过招聘信息ID删除单条信息
	boolean deleteByRecruitmentId(int RecruitmentId);
	
	/*//通过ID修改招聘信息
	boolean updateRecruitmentInfoByRecruitmentId(int recruitmentId);*/
	
	//修改招聘信息(管理员用)
	boolean updateByRecruitment(Recruitment recruitment);
}
