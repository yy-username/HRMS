package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class User implements Serializable {
	private int userId; // 用户ID
	private String nickName; // 昵称
	private String userName; // 真实姓名
	private String password; // 密码
	private String sex; // 性别
	private int age; // 年龄
	private String nation; // 民族
	private String foreignLevel; //外语水平
	private String politicalLandscape; //政治面貌
	private String marriage; //婚姻状况
	private String graduateSchool; //毕业院校
	private String birth; // 出生日期
	private String IDCard; // 身份证号
	private String education; // 学历
	private String address; // 住址
	private String mobile; // 电话
	private String email; // 邮箱
	private int userStatus; // 用户状态(1:游客, 2:员工, 3:管理员)
	private int deptId; // 所在部门ID
	private String deptName; //所在部门名称
	private int positionId; // 职位ID
	private String positionName; //职位名称
	private Date createTime; // 注册时间
	private Date updateTime; // 更新时间
	private Dept dept;
	private Position position;
	private Salary salary;
	
	public User() {
		super();
	}

	public User(int userId, String nickName, String userName, String password, String sex, int age, String nation,
			String foreignLevel, String politicalLandscape, String marriage, String graduateSchool, String birth,
			String iDCard, String education, String address, String mobile, String email, int userStatus, int deptId,
			int positionId, Date createTime, Date updateTime) {
		super();
		this.userId = userId;
		this.nickName = nickName;
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.age = age;
		this.nation = nation;
		this.foreignLevel = foreignLevel;
		this.politicalLandscape = politicalLandscape;
		this.marriage = marriage;
		this.graduateSchool = graduateSchool;
		this.birth = birth;
		this.IDCard = iDCard;
		this.education = education;
		this.address = address;
		this.mobile = mobile;
		this.email = email;
		this.userStatus = userStatus;
		this.deptId = deptId;
		this.positionId = positionId;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getIDCard() {
		return IDCard;
	}

	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
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

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	/*public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}*/

	public String getUpdateTime() {
		return MyUtil.returnTime(updateTime);
	}

	/*public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}*/

	public String getForeignLevel() {
		return foreignLevel;
	}

	public void setForeignLevel(String foreignLevel) {
		this.foreignLevel = foreignLevel;
	}

	public String getPoliticalLandscape() {
		return politicalLandscape;
	}

	public void setPoliticalLandscape(String politicalLandscape) {
		this.politicalLandscape = politicalLandscape;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getGraduateSchool() {
		return graduateSchool;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", nickName=" + nickName + ", userName=" + userName + ", password=" + password
				+ ", sex=" + sex + ", age=" + age + ", nation=" + nation + ", foreignLevel=" + foreignLevel
				+ ", politicalLandscape=" + politicalLandscape + ", marriage=" + marriage + ", graduateSchool="
				+ graduateSchool + ", birth=" + birth + ", IDCard=" + IDCard + ", education=" + education + ", address="
				+ address + ", mobile=" + mobile + ", email=" + email + ", userStatus=" + userStatus + ", deptId="
				+ deptId + ", positionId=" + positionId + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ "]";
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Salary getSalary() {
		return salary;
	}

	public void setSalary(Salary salary) {
		this.salary = salary;
	}

	
	
}
