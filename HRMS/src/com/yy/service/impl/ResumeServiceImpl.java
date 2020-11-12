package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.ResumeDao;
import com.yy.dao.UserDao;
import com.yy.entity.Resume;
import com.yy.entity.User;
import com.yy.service.ResumeService;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeDao resumeDao;
	@Autowired
	private UserDao userDao;
	
	/**
	 * 添加简历
	 * @param Resume 传入要添加的简历对象,用户ID
	 * @return boolean 返回true表示添加成功，返回false表示添加失败
	 */
	@Override
	public boolean addResume(Resume resume, User user) {

		if (resumeDao.addResume(resume)) {
			userDao.updateUserByUser(user);
			return true;
		}
		return false;
	}

	/**
	 * 通过用户ID查找简历
	 * @param int 传入用户ID
	 * @return List 返回List集合(一个用户会有多份简历)
	 */
	@Override
	public List<Resume> queryResumeByUserId(int userId) {
		
		return resumeDao.queryResumeByUserId(userId);
	}

	/**
	 * 通过简历ID查找简历
	 * @param int 传入简历ID
	 * @return Resume 返回简历对象
	 */
	@Override
	public Resume queryResumeByResumeId(int resumeId) {
		
		return resumeDao.queryResumeByResumeId(resumeId);
	}

	/**
	 * 遍历所有简历
	 * @return List 返回List集合(管理员查看简历投递情况用)
	 */
	@Override
	public List<Resume> queryAllResume() {
		
		return resumeDao.queryAllResume();
	}

	/**
	 * 修改简历
	 * @param int 传入要修改的简历ID
	 * @return Resume 返回简历对象
	 */
	@Override
	public boolean modifyResume(Resume resume) {
		if (resume == null) {
			return false;
		}
		return resumeDao.modifyResume(resume);
	}

	/**
	 * 删除个人所有简历
	 * @param int 传入用户ID
	 * @return boolean 返回true表示删除成功，返回false表示删除失败
	 */
	@Override
	public boolean deleteResumeByUserId(int userId) {
		
		return resumeDao.deleteResume(userId);
	}

	/**
	 * 通过简历ID删除单条简历
	 * @param int 传入简历ID
	 * @return boolean 返回true表示删除成功，返回false表示删除失败
	 */
	@Override
	public boolean deleteResumeByResumeId(int resumeId) {
		
		return resumeDao.deleteResumeByResumeId(resumeId);
	}

	@Override
	public int isdeliveryResume(int resumeId) {

		return resumeDao.isdeliveryResume(resumeId);
	}

	/**
	 * 修改简历
	 */
	@Override
	public boolean updateResume(Resume resume) {

		return resumeDao.updateResume(resume);
	}

	/**
	 * 管理员查看应聘者简历
	 */
	@Override
	public Resume queryResumeByResumeIdAndUserId(Resume resume) {
		if (resume == null) {
			return null;
		}
		return resumeDao.queryResumeByResumeIdAndUserId(resume);
	}

	
}
