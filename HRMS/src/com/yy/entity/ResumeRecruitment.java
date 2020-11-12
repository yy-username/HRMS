package com.yy.entity;

public class ResumeRecruitment {

	private int resumeRecruitmenId; // 简历招聘信息ID
	private int resumeId; // 简历ID
	private int recruitmentId; // 招聘信息ID
	private int sate; //投递状态
	
	public int getResumeRecruitmenId() {
		return resumeRecruitmenId;
	}

	public void setResumeRecruitmenId(int resumeRecruitmenId) {
		this.resumeRecruitmenId = resumeRecruitmenId;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public int getRecruitmentId() {
		return recruitmentId;
	}

	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}

	public int getSate() {
		return sate;
	}

	public void setSate(int sate) {
		this.sate = sate;
	}

}
