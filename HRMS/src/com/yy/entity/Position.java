package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Position implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int positionId;
	private String positionName;
	private int deptId;
	private Date createTime; 
	private Date updateTime;

	public Position() {
		super();
	}

	public Position(int positionId, String positionName, int deptId) {
		super();
		this.positionId = positionId;
		this.positionName = positionName;
		this.deptId = deptId;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	public String getUpdateTime() {
		return MyUtil.returnTime(updateTime);
	}

}
