package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Dept implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int deptId;
	private String deptName; //部门名称
	private String deptIntroduction; //部门详情
	private Date createTime; //创建时间
	private Date updateTime; //修改时间
	
	private Position position;

	public Dept() {
		super();
	}

	public Dept(int deptId, String deptName, String deptIntroduction, Position position) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptIntroduction = deptIntroduction;
		this.position = position;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public String getDeptIntroduction() {
		return deptIntroduction;
	}

	public void setDeptIntroduction(String deptIntroduction) {
		this.deptIntroduction = deptIntroduction;
	}

	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", deptName=" + deptName + ", deptIntroduction=" + deptIntroduction
				+ ", position=" + position + "]";
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	public String getUpdateTime() {
		return MyUtil.returnTime(updateTime);
	}

	
	
	
}
