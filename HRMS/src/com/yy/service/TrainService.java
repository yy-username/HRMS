package com.yy.service;

import java.util.List;

import com.yy.entity.Train;

public interface TrainService {

	//添加培训信息
	boolean addTrainInfo(Train train);
	
	//查看所有培训信息
	List<Train> queryAllTrainInfo();
	
	//查看所有发布的培训信息
	List<Train> queryReleaseTrainInfo();
	
	//通过ID查看单条培训信息
	Train queryTrainInfo(int trainId);
	
	//删除单条培训信息
	boolean deleteTrainInfo(int trainId);
	
	//更新培训信息
	boolean updateTrainInfo(Train train);
	
	//发布培训信息
	boolean updateTrainRelease(int trainId);
}
