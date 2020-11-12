package com.yy.service;

import java.util.List;

import com.yy.entity.Dept;

public interface DeptService {

	//添加部门(管理员用)
	boolean addDept(Dept dept);
		
	//通过部门名称查找部门
	Dept queryDeptByDeptId(int deptId);
	
	//通过部门名称查找部门
	Dept queryDeptByDeptName(String deptName);
		
	//遍历所有部门
	List<Dept> queryAllDept();
	
	//删除部门
	boolean deleteDeptByDeptId(int deptId);
	
	//删除所有部门
	boolean deleteAllDept();
	
	//修改部门信息
	boolean updateDept(Dept dept);
}
