package com.yy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.ResumeRecruitmentDao;
import com.yy.entity.ResumeRecruitment;
import com.yy.service.ResumeRecruitmentService;

@Service
public class ResumeRecruitmentServiceImpl implements ResumeRecruitmentService{

	@Autowired
	private ResumeRecruitmentDao resumeRecruitmentDao;
	
	/**
	 * 投递简历
	 * @param ResumeRecruitment 传入ResumeRecruitment
	 * @return boolean 返回true表示添加成功，返回法拉瑟表示添加失败
	 */
	@Override
	public boolean addResumeRecruitment(ResumeRecruitment resumeRecruitment) {

		return resumeRecruitmentDao.addResumeRecruitment(resumeRecruitment);
	}

	/**
	 * 查询某条招聘信息有几份简历投递
	 * @param int 传入招聘信息对应的ID
	 * @return 返回ResumeRecruitment对象
	 */
	@Override
	public ResumeRecruitment queryResume(int recruitmentId) {

		return resumeRecruitmentDao.queryResume(recruitmentId);
	}

	/**
	 * 查询某条简历所投递的招聘信息
	 * @param 传入简历对应的ID
	 * @return 返回ResumeRecruitment对象
	 */
	@Override
	public ResumeRecruitment queryRecruitment(int resumeId) {

		return resumeRecruitmentDao.queryRecruitment(resumeId);
	}

	/**
	 * 查看投递状态(用户在简历页面用)
	 * 
	 */
	@Override
	public ResumeRecruitment queryState(int resumeId, int sate) {

		return resumeRecruitmentDao.queryState(resumeId, sate);
	}

}
