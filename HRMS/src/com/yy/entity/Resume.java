package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Resume implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int resumeId; //简历ID
	private int interviewId; //面试邀请ID
	private int recruitmentId; //招聘信息ID
	private String resumeName; //简历名称
	private int userId; //用户ID
	private String jobIntension; //应聘职位
	private String resumeEducation; //教育背景
	private String workExperience; //工作经验
	private String skillsCertificate; //技能证书
	private String selfAssessment; //自我评价
	private Integer deliveryStatus=0; //投递状态
	private Date createTime; //简历创建时间
	private Date deliveryTime; //简历投递时间
	private User user;
	private Interview interview;
	
	public Resume() {
		super();
	}

	public Resume(int resumeId, String resumeName, int userId, String resumeEducation, String workExperience,
			String skillsCertificate, String selfAssessment, int deliveryStatus, Date createTime, Date deliveryTime) {
		super();
		this.resumeId = resumeId;
		this.resumeName = resumeName;
		this.userId = userId;
		this.resumeEducation = resumeEducation;
		this.workExperience = workExperience;
		this.skillsCertificate = skillsCertificate;
		this.selfAssessment = selfAssessment;
		this.deliveryStatus = deliveryStatus;
		this.createTime = createTime;
		this.deliveryTime = deliveryTime;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getResumeEducation() {
		return resumeEducation;
	}

	public void setResumeEducation(String resumeEducation) {
		this.resumeEducation = resumeEducation;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	public String getSkillsCertificate() {
		return skillsCertificate;
	}

	public void setSkillsCertificate(String skillsCertificate) {
		this.skillsCertificate = skillsCertificate;
	}

	public String getSelfAssessment() {
		return selfAssessment;
	}

	public void setSelfAssessment(String selfAssessment) {
		this.selfAssessment = selfAssessment;
	}

	public int getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(int deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	public String getDeliveryTime() {
		return MyUtil.returnTime(deliveryTime);
	}


	public String getJobIntension() {
		return jobIntension;
	}

	public void setJobIntension(String jobIntension) {
		this.jobIntension = jobIntension;
	}

	public int getRecruitmentId() {
		return recruitmentId;
	}

	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Interview getInterview() {
		return interview;
	}

	public void setInterview(Interview interview) {
		this.interview = interview;
	}

	public int getInterviewId() {
		return interviewId;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}

}
