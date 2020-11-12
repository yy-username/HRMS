package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.PositionDao;
import com.yy.entity.Position;
import com.yy.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionDao positionDao;
	
	/**
	 * 添加职位
	 */
	@Override
	public boolean addPosition(Position position) {
		
		return positionDao.addPosition(position);
	}

	/**
	 * 通过职位名称查找
	 */
	@Override
	public Position queryPositionByPositionName(String deptName) {
		
		return positionDao.queryPositionByPositionName(deptName);
	}

	/**
	 * 遍历所有职位
	 */
	@Override
	public List<Position> queryAllPosition() {
		
		return positionDao.queryAllPosition();
	}

	/**
	 * 通过职位ID删除职位
	 */
	@Override
	public boolean deletePositionByPositionId(int positionId) {
		
		return positionDao.deletePositionByPositionId(positionId);
	}

	/**
	 * 通过部门ID删除职位
	 */
	@Override
	public boolean deletePositionByDeptId(int deptId) {

		return positionDao.deletePositionByDeptId(deptId);
	}

	/**
	 * 删除所有职位
	 */
	@Override
	public boolean deleteAllPosition() {

		return positionDao.deleteAllPosition();
	}

	@Override
	public Position queryPositionById(int positionId) {

		return positionDao.queryPositionById(positionId);
	}

	@Override
	public boolean updatePosition(Position position) {
		if (position == null) {
			return false;
		}
		return positionDao.updatePosition(position);
	}

	
}
