package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.TrainDao;
import com.yy.entity.Train;
import com.yy.service.TrainService;

@Service
public class TrainServiceImpl implements TrainService {
	
	@Autowired
	private TrainDao trainDao;

	/**
	 * 添加培训信息
	 */
	@Override
	public boolean addTrainInfo(Train train) {
		if (train == null) {
			return false;
		}
		return trainDao.addTrainInfo(train);
	}

	/**
	 * 查询所有的培训信息
	 */
	@Override
	public List<Train> queryAllTrainInfo() {

		return trainDao.queryAllTrainInfo();
	}

	/**
	 * 查询单条培训信息
	 */
	@Override
	public Train queryTrainInfo(int trainId) {

		if (trainId == 0) {
			return null;
		}
		return trainDao.queryTrainInfo(trainId);
	}

	/**
	 * 删除单条培训信息
	 */
	@Override
	public boolean deleteTrainInfo(int trainId) {

		if (trainId == 0) {
			return false;
		}
		return trainDao.deleteTrainInfo(trainId);
	}

	/**
	 * 更新培训信息
	 */
	@Override
	public boolean updateTrainInfo(Train train) {
		if (train == null) {
			return false;
		}
		return trainDao.updateTrainInfo(train);
	}
	
	/**
	 * 发布培训信息
	 */
	@Override
	public boolean updateTrainRelease(int trainId) {

		if (trainId == 0) {
			return false;
		}
		
		return trainDao.updateTrainRelease(trainId);
	}

	@Override
	public List<Train> queryReleaseTrainInfo() {

		return trainDao.queryReleaseTrainInfo();
	}

}
