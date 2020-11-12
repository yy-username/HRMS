package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.RecruitmentDao;
import com.yy.entity.Recruitment;
import com.yy.service.RecruitmentService;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	
	@Autowired
	private RecruitmentDao recruitmentDao;
	
	//添加发布信息
	@Override
	public boolean addRecruitmentInfo(Recruitment recruitment) {
		
		return recruitmentDao.addRecruitmentInfo(recruitment);
	}

	@Override
	public List<Recruitment> queryAllRecruitmentInfo() {

		return recruitmentDao.queryAllRecruitmentInfo();
	}

	//通过ID查找发布信息
	@Override
	public Recruitment queryRecruitmentInfoByRecruitmentId(int recruitmentId) {

		return recruitmentDao.queryRecruitmentInfoByRecruitmentId(recruitmentId);
	}

	//发布招聘信息把发布状态由0改为1
	@Override
	public boolean updateByRecruitmentId(int recruitmentId) {

		return recruitmentDao.updateByRecruitmentId(recruitmentId);
	}

	//删除招聘信息
	@Override
	public boolean deleteByRecruitmentId(int recruitmentId) {

		return recruitmentDao.deleteByRecruitmentId(recruitmentId);
	}

	//修改未发布的招聘信息
	/*@Override
	public boolean updateRecruitmentInfoByRecruitmentId(int recruitmentId) {
		
		return recruitmentDao.updateRecruitmentInfoByRecruitmentId(recruitmentId);
	}*/

	/**
	 * 修改招聘信息
	 */
	@Override
	public boolean updateByRecruitment(Recruitment recruitment) {
		if (recruitment == null) {
			return false;
		}
		return recruitmentDao.updateByRecruitment(recruitment);
	}

	
	
}
