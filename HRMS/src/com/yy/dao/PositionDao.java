package com.yy.dao;

import java.util.List;

import com.yy.entity.Position;

public interface PositionDao {

	//添加职位(管理员用)
	boolean addPosition(Position position);
		
	//通过职位名称查找职位
	Position queryPositionByPositionName(String deptName);
	
	//查找每个部门的职位详情
	void queryPositionByDeptId(int deptId);
		
	//遍历所有职位
	List<Position> queryAllPosition();
	
	//通过职位ID删除职位
	boolean deletePositionByPositionId(int positionId);
	
	//通过部门ID删除职位
	boolean deletePositionByDeptId(int deptId);
	
	//删除所有职位
	boolean deleteAllPosition();
	
	//通过职位ID查找职位
	Position queryPositionById(int positionId);
	
	//修改职位
	boolean updatePosition(Position position);
}
