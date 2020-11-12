package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.InterviewDao;
import com.yy.entity.Interview;
import com.yy.service.InterviewService;

@Service
public class InterviewServiceImpl implements InterviewService {

	@Autowired
	private InterviewDao interviewDao;
	
	/**
	 * 新增面试邀请
	 * @param Interview 传入需要添加的面试邀请对象
	 * @return boolean 返回true表示添加成功，返回false表示添加失败
	 */
	@Override
	public boolean addInterview(Interview interview) {
		if (interview == null) {
			return false;
		}
		return interviewDao.addInterview(interview);
	}

	/**
	 * 查看收到的所有面试邀请(游客用)
	 * @param int 传入用户ID
	 * @return List<Interview> 返回list集合
	 */
	@Override
	public List<Interview> queryInterviewInfo(int userId) {
		if (userId == 0) {
			return null;
		}
		return interviewDao.queryInterviewInfo(userId);
	}

	/**
	 * 查看单条面试邀请(游客用)
	 * @param int 传入面试邀请ID
	 * @return Interview 返回单条Interview对象
	 */
	@Override
	public Interview queryInterviewSingleInfo(int interviewId) {
		
		return interviewDao.queryInterviewSingleInfo(interviewId);
	}

	/**
	 * 遍历发送的所有面试邀请
	 * @return List<Interview> 返回list集合
	 */
	@Override
	public List<Interview> iteratorInterview() {
		
		return interviewDao.iteratorInterview();
	}

	/**
	 * 游客确认参加面试
	 */
	@Override
	public boolean updateConfirmInterview(int interviewId) {

		if (interviewId == 0) {
			return false;
		}
		return interviewDao.updateConfirmInterview(interviewId);
	}

	/**
	 * 面试打分
	 */
	@Override
	public boolean updateInterviewScore(Interview interview) {
		if (interview == null) {
			return false;
		}
		return interviewDao.updateInterviewScore(interview);
	}

	/**
	 * 查看面试打分
	 */
	@Override
	public Interview queryInterviewScore(Interview interview) {

		if (interview == null) {
			return null;
		}
		return interviewDao.queryInterviewScore(interview);
	}

	/**
	 * 面试通过
	 */
	@Override
	public boolean updateInterviewPass(int interviewId) {

		if (interviewId == 0) {
			return false;
		}
		return interviewDao.updateInterviewPass(interviewId);
	}

	/**
	 * 录用
	 */
	@Override
	public boolean updateEmployed(Interview interview) {

		if (interview == null) {
			return false;
		}
		return interviewDao.updateEmployed(interview);
	}

	/**
	 * 入职
	 */
	@Override
	public boolean updateEntry(int interviewId) {

		if (interviewId == 0) {
			return false;
		}
		return interviewDao.updateEntry(interviewId);
	}

}
