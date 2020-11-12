package com.yy.entity;

import java.io.Serializable;
import java.util.Date;

import com.yy.utils.MyUtil;

public class Train implements Serializable{

	private int trainId;
	private String trainName; // 培训标题
	private String trainContent; // 培训内容
	private int status; // 状态0 未发布，1发布
	private Date createTime; // 创建时间
	private Date updateTime; // 修改时间
	private Date releaseTime; // 发布时间

	public int getTrainId() {
		return trainId;
	}

	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getTrainContent() {
		return trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreateTime() {
		return MyUtil.returnTime(createTime);
	}

	public String getUpdateTime() {
		return MyUtil.returnTime(updateTime);
	}

	public String getReleaseTime() {
		return MyUtil.returnTime(releaseTime);
	}

	

}
