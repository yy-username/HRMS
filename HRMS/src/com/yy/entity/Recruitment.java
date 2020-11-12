package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Recruitment implements Serializable{

	private int recruitmentId; // 招聘信息ID
	private String recruitmentTitle; // 招聘信息标题
	private String salaryRange; //薪资范围
	private String companyName; // 公司名称
	private String companyArea; // 公司地点
	private String companyState; // 公司状态（上市、民营、国企）
	private String companySize; // 公司规模（人数范围）
	private String companyIntroduction; // 公司简介
	private String jobRequirement; //招聘要求简介(人数、学历、工作经验年限)
	private String recruitmentContent; // 招聘信息内容
	private String welfareTreatment; //福利待遇
	private int isRelease; //是否发布
	private Date recruitmentTime; // 创建时间
	private Date modifyTime; //修改时间
	private Date releaseTime; //发布时间
	private Resume resume;
	
	public Recruitment() {
		super();
	}

	public Recruitment(int recruitmentId, String recruitmentTitle, String salaryRange, String companyName,
			String companyArea, String companyState, String companySize, String companyIntroduction,
			String jobRequirement, String recruitmentContent, String welfareTreatment, Date recruitmentTime,
			Date releaseTime) {
		super();
		this.recruitmentId = recruitmentId;
		this.recruitmentTitle = recruitmentTitle;
		this.salaryRange = salaryRange;
		this.companyName = companyName;
		this.companyArea = companyArea;
		this.companyState = companyState;
		this.companySize = companySize;
		this.companyIntroduction = companyIntroduction;
		this.jobRequirement = jobRequirement;
		this.recruitmentContent = recruitmentContent;
		this.welfareTreatment = welfareTreatment;
		this.recruitmentTime = recruitmentTime;
		this.releaseTime = releaseTime;
	}

	public int getRecruitmentId() {
		return recruitmentId;
	}

	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}

	public String getRecruitmentTitle() {
		return recruitmentTitle;
	}

	public void setRecruitmentTitle(String recruitmentTitle) {
		this.recruitmentTitle = recruitmentTitle;
	}

	public String getRecruitmentContent() {
		return recruitmentContent;
	}

	public void setRecruitmentContent(String recruitmentContent) {
		this.recruitmentContent = recruitmentContent;
	}

	public String getRecruitmentTime() {
		return MyUtil.returnTime(recruitmentTime);
	}

	/*public void setRecruitmentTime(Date recruitmentTime) {
		this.recruitmentTime = recruitmentTime;
	}*/

	public String getWelfareTreatment() {
		return welfareTreatment;
	}

	public void setWelfareTreatment(String welfareTreatment) {
		this.welfareTreatment = welfareTreatment;
	}

	public String getSalaryRange() {
		return salaryRange;
	}

	public void setSalaryRange(String salaryRange) {
		this.salaryRange = salaryRange;
	}

	public String getJobRequirement() {
		return jobRequirement;
	}

	public void setJobRequirement(String jobRequirement) {
		this.jobRequirement = jobRequirement;
	}

	public String getReleaseTime() {
		return MyUtil.returnTime(releaseTime);
	}

	/*public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}*/

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyArea() {
		return companyArea;
	}

	public void setCompanyArea(String companyArea) {
		this.companyArea = companyArea;
	}

	public String getCompanyState() {
		return companyState;
	}

	public void setCompanyState(String companyState) {
		this.companyState = companyState;
	}

	public String getCompanySize() {
		return companySize;
	}

	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}

	public String getCompanyIntroduction() {
		return companyIntroduction;
	}

	public void setCompanyIntroduction(String companyIntroduction) {
		this.companyIntroduction = companyIntroduction;
	}

	public int getIsRelease() {
		return isRelease;
	}

	public String getModifyTime() {
		return MyUtil.returnTime(modifyTime);
	}

	/*public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}*/

	public void setIsRelease(int isRelease) {
		this.isRelease = isRelease;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

}
