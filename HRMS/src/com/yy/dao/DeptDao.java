package com.yy.dao;

import java.util.List;

import com.yy.entity.Dept;

public interface DeptDao {

	//添加部门(管理员用)
	boolean addDept(Dept dept);
	
	//通过部门ID查找部门
	Dept queryDeptByDeptId(int deptId);
	
	//通过部门名称查找部门
	Dept queryDeptByDeptName(String deptName);
	
	//遍历所有部门
	List<Dept> queryAllDept();
	
	//通过部门ID删除部门
	boolean deleteDeptByDeptId(int deptId);
	
	//删除所有部门
	boolean deleteAllDept();
	
	//修改部门信息
	boolean updateDept(Dept dept);
	
	//通过部门ID更改部门信息
	boolean updateDeptById(int deptId);
}
