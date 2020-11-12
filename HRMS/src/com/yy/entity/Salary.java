package com.yy.entity;

import java.util.Date;

import com.yy.utils.MyUtil;

public class Salary {

	private int salaryId; //薪资ID
	private int userId; //用户ID
	private int deptId; //部门ID
	private int positionId; //职位ID
	private double baseSalary; //基本薪资
	private double trafficAllowance; //交通补贴
	private double communicationAllowance; //通讯补贴
	private double performanceBonus; //绩效奖金
	private int fineId; //奖惩ID
	private double endowmentInsurance; //养老保险
	private double medicalInsurance; //医疗保险
	private double unemploymentInsurance; //失业保险
	private double injuryInsurance; //工伤保险
	private double birthInsurance; //生育保险
	private double housingFund; //住房公积金
	private double totalSalary; //薪资总额
	private Date createTime; //创建时间
	private User user;
	private Fine fine;
	
	public Salary() {
		super();
	}

	public Salary(int salaryId, int userId, int deptId, int positionId, double baseSalary, double trafficAllowance,
			double communicationAllowance, double performanceBonus, int fineId, double endowmentInsurance,
			double medicalInsurance, double unemploymentInsurance, double injuryInsurance, double birthInsurance,
			double housingFund, double totalSalary) {
		super();
		this.salaryId = salaryId;
		this.userId = userId;
		this.deptId = deptId;
		this.positionId = positionId;
		this.baseSalary = baseSalary;
		this.trafficAllowance = trafficAllowance;
		this.communicationAllowance = communicationAllowance;
		this.performanceBonus = performanceBonus;
		this.fineId = fineId;
		this.endowmentInsurance = endowmentInsurance;
		this.medicalInsurance = medicalInsurance;
		this.unemploymentInsurance = unemploymentInsurance;
		this.injuryInsurance = injuryInsurance;
		this.birthInsurance = birthInsurance;
		this.housingFund = housingFund;
		this.totalSalary = totalSalary;
	}

	public int getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(int salaryId) {
		this.salaryId = salaryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public double getTotalSalary() {
		return totalSalary;
	}

	public void setTotalSalary(double totalSalary) {
		this.totalSalary = totalSalary;
	}

	public double getTrafficAllowance() {
		return trafficAllowance;
	}

	public void setTrafficAllowance(double trafficAllowance) {
		this.trafficAllowance = trafficAllowance;
	}

	public double getCommunicationAllowance() {
		return communicationAllowance;
	}

	public void setCommunicationAllowance(double communicationAllowance) {
		this.communicationAllowance = communicationAllowance;
	}

	public double getPerformanceBonus() {
		return performanceBonus;
	}

	public void setPerformanceBonus(double performanceBonus) {
		this.performanceBonus = performanceBonus;
	}

	public int getFineId() {
		return fineId;
	}

	public void setFineId(int fineId) {
		this.fineId = fineId;
	}

	public double getEndowmentInsurance() {
		return endowmentInsurance;
	}

	public void setEndowmentInsurance(double endowmentInsurance) {
		this.endowmentInsurance = endowmentInsurance;
	}

	public double getMedicalInsurance() {
		return medicalInsurance;
	}

	public void setMedicalInsurance(double medicalInsurance) {
		this.medicalInsurance = medicalInsurance;
	}

	public double getUnemploymentInsurance() {
		return unemploymentInsurance;
	}

	public void setUnemploymentInsurance(double unemploymentInsurance) {
		this.unemploymentInsurance = unemploymentInsurance;
	}

	public double getInjuryInsurance() {
		return injuryInsurance;
	}

	public void setInjuryInsurance(double injuryInsurance) {
		this.injuryInsurance = injuryInsurance;
	}

	public double getBirthInsurance() {
		return birthInsurance;
	}

	public void setBirthInsurance(double birthInsurance) {
		this.birthInsurance = birthInsurance;
	}

	public double getHousingFund() {
		return housingFund;
	}

	public void setHousingFund(double housingFund) {
		this.housingFund = housingFund;
	}

	public double getBaseSalary() {
		return baseSalary;
	}

	public void setBaseSalary(double baseSalary) {
		this.baseSalary = baseSalary;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Fine getFine() {
		return fine;
	}

	public void setFine(Fine fine) {
		this.fine = fine;
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

}
