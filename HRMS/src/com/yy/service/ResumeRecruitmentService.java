package com.yy.service;

import com.yy.entity.ResumeRecruitment;

public interface ResumeRecruitmentService {

	//投递简历
	boolean addResumeRecruitment(ResumeRecruitment resumeRecruitment);
	
	//查询某条招聘信息有几份简历投递
	ResumeRecruitment queryResume(int recruitmentId);
	
	//查询某条简历所投递的招聘信息
	ResumeRecruitment queryRecruitment(int resumeId);
	
	//查看投递状态(用户在简历页面用)
	ResumeRecruitment queryState(int resumeId, int sate);
}
